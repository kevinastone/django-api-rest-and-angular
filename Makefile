clean:
	rm -f example.sqlite

create_database:
	./manage.py syncdb --noinput
	./manage.py migrate --noinput
	./manage.py createsuperuser --username=root --email=root@example.com --noinput

make_fixtures:
	DJANGO_SETTINGS_MODULE='example.settings' ./scripts/create_users.py
	DJANGO_SETTINGS_MODULE='example.settings' ./scripts/create_posts.py
	DJANGO_SETTINGS_MODULE='example.settings' ./scripts/create_photos.py

all: clean create_database make_fixtures