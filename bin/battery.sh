#!/bin/sh

# If ACPI was not installed, this probably is a battery-less computer.
ACPI_RES=$(timeout 0.2s acpi -b)
ACPI_CODE=$?
if [ $ACPI_CODE -eq 0 ]
then
    # Get essential information. Due to som bug with some versions of acpi it is
    # worth filtering the ACPI result from all lines containing "unavailable".
    BAT_LEVEL_ALL=$(echo "$ACPI_RES" | grep -v "unavailable" | grep -E -o "[0-9][0-9]?[0-9]?%")
    BAT_LEVEL=$(echo "$BAT_LEVEL_ALL" | awk -F"%" 'BEGIN{tot=0;i=0} {i++; tot+=$1} END{printf("%d%%\n", tot/i)}')
    TIME_LEFT=$(echo "$ACPI_RES" | grep -v "unavailable" | grep -E -o "[0-9]{2}:[0-9]{2}:[0-9]{2}")
    IS_CHARGING=$(echo "$ACPI_RES" | grep -v "unavailable" | awk '{ printf("%s\n", substr($3, 0, length($3)-1) ) }')
    INFO="🔋$BAT_LEVEL"
    # If there is no 'time left' information (when almost fully charged) we 
    # provide information ourselvs.
    if [ "$IS_CHARGING" = "Charging" ]
    then
        TIME_LEFT=$(echo $TIME_LEFT | awk '{ printf("%s\n", substr($1, 0, 5)) }')
        INFO="${INFO} ⏳${TIME_LEFT}"
    fi

    # Print full text. The charging data.
    echo "${INFO}"

    # Print the short text.
    echo "BAT: $BAT_LEVEL"
    
    # Change the font color, depending on the situation.
    if [ "$IS_CHARGING" = "Charging" ]
    then
        # Charging yellow color.
        echo "#D0D000"
    else
        if [ "${BAT_LEVEL%?}" -le 15 ]
        then
            # Battery very low. Red color.
            echo "#FA1E44"
        else
            # Battery not charging but at decent level. Green color.
            echo "#007872"
        fi
    fi
fi
