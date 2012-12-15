# Set permissions for websites on server (using chmod, chown, chgrp)
# Usage: set your username, group, directories and run 'sudo bash permissions.sh'

# list of all web directories
web_dirs=( 
	com_myweb_example1
	com_myweb_example2
	com_myweb_example3
	com_mywordpress_example1
	com_mywordpress_example2
	com_mywordpress_example3 )

# list of web directories with Wordpress
wordpress_dirs=( 
	com_mywordpress_example1
	com_mywordpress_example2
	com_mywordpress_example3 )
	
# set permissions for web directories
echo GLOBAL:
for dir in ${web_dirs[@]}
do
	echo $dir
	sudo chown -R myname ./$dir # set your username
	sudo chgrp -R mygroup ./$dir # set your group
	sudo find ./$dir -type d -exec chmod 750 {} \; # for all directories
	sudo find ./$dir -type f -exec chmod 640 {} \; # for all files
done

# set permissions for Wordpress
echo WORDPRESS:
for dir in ${wordpress_dirs[@]}
do
	echo $dir
	sudo chmod 640 ./$dir/www/wp-config.php
	sudo find ./$dir/www/wp-content/uploads -type d -exec chmod 770 {} \;
done
