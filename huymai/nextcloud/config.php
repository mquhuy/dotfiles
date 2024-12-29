<?php
$CONFIG = array (
  'htaccess.RewriteBase' => '/',
  'memcache.local' => '\\OC\\Memcache\\APCu',
  'apps_paths' => 
  array (
    0 => 
    array (
      'path' => '/var/www/html/apps',
      'url' => '/apps',
      'writable' => false,
    ),
    1 => 
    array (
      'path' => '/var/www/html/custom_apps',
      'url' => '/custom_apps',
      'writable' => true,
    ),
  ),
  'upgrade.disable-web' => true,
  'instanceid' => 'ocowa35ykr25',
  'passwordsalt' => 'mzIJhS8hrPAlGCa1uAmWR2bnHtcY7u',
  'secret' => 'UDx5Jf1IOWcKyP1LEslEX0qxwc8CNLmh7O/eefa6PPSXlkkm',
  'trusted_domains' => 
  array (
    0 => 'localhost',
    1 => 'next.huymai.fi',
  ),
  'datadirectory' => '/var/www/html/data',
  'dbtype' => 'mysql',
  'version' => '30.0.4.1',
  'overwriteprotocol' => 'https',
  'overwrite.cli.url' => 'https://next.huymai.fi',
  'dbname' => 'nextcloud',
  'dbhost' => 'db',
  'dbport' => '',
  'dbtableprefix' => 'oc_',
  'mysql.utf8mb4' => true,
  'dbuser' => 'nextcloud_user',
  'dbpassword' => 'nextcloud_password',
  'installed' => true,
);
