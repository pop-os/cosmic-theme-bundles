rootdir := ''
prefix := '/usr'

usrdir := absolute_path(clean(rootdir / prefix))
default-schema-target := usrdir / 'share' / 'cosmic'
backgroundsdir := usrdir / 'share' / 'backgrounds' / 'cosmic'
iconsdir := usrdir / 'share' / 'icons'

default:
    @just --list

install:
    cd resources/default_schema && find * -type f -exec install -Dm0644 '{}' '{{default-schema-target}}/{}' \;
    cd resources/backgrounds && find * -type f -exec install -Dm0644 '{}' '{{backgroundsdir}}/{}' \;
    cd resources/icons && find * -type f -exec install -Dm0644 '{}' '{{iconsdir}}/{}' \;

uninstall:
    cd resources/default_schema && find * -type f -exec rm '{{default-schema-target}}/{}' \;
    cd resources/backgrounds && find * -type f -exec rm '{{backgroundsdir}}/{}' \;
    cd resources/icons && find * -type f -exec rm '{{iconsdir}}/{}' \;
