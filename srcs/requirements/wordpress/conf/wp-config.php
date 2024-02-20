<?php

define( 'DB_NAME', "$DB_NAME" );  

/** Database username */
define( 'DB_USER', "$DB_USER" ); 

/** Database password */
define( 'DB_PASSWORD', "$DB_PASSWORD" ); 

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' ); # mariadb:3306  

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' ); 


define('WP_CACHE_KEY_SALT', 'tbaskhan.42.fr'); # Changer la valeur de WP_CACHE_KEY_SALT pour invalider les cookies existants. Cela forcera tous les utilisateurs à se reconnecter.
/**#@-*/

$table_prefix = 'wp_';
#Avec ca on va pouvoir installer plusieurs wordpress sur la même base de données

define( 'WP_DEBUG', true ); # true pour activer le mode débogage. false pour le désactiver.
define('WP_ALLOW_REPAIR', true); # true pour activer la réparation de la base de données. false pour le désactiver.

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
?>