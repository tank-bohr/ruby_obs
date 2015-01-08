# Ruby for OBS

Утилита для сборки ruby-2.1 в deb-пакет с помощью системы [OBS](http://openbuildservice.org/).

## Запуск

`./bin/make_obs_package`

В результате выполнения этого скрипта должна создаться папка `out`.

Содержимое этой папки необходимо аккуратно поместить в пакет на OBS.

## Сборка пакета в OBS

Сборка пакета OBS не является предметом этого документа, поэтому отсылаем читателя к соответствующей документации.

## Использование полученного пакета

* Обновляем sources.list и добавляем ключ (от рута)
```
# echo 'deb http://download.opensuse.org/repositories/home:/tank_bohr/xUbuntu_14.04 ./' >> /etc/apt/sources.list
# wget -qO - http://download.opensuse.org/repositories/home:/tank_bohr/xUbuntu_14.04/Release.key | apt-key add -
```

* `sudo apt-get update`

```
$ sudo apt-cache search ruby-2.1
ruby-2.1 - Ruby 2.1 with prefix
```

Успех!

* Установка `sudo apt-get install ruby-2.1`

* Пакет собирается с префиксом. В этом его назначение

`export PATH=/opt/ruby-2.1/bin:$PATH`

* PROFIT!!!

```
$ ruby -v
ruby 2.1.5p273 (2014-11-13 revision 48405) [x86_64-linux]
$ which ruby
/opt/ruby-2.1/bin/ruby
```

## Дополнительная информация

* [OBS](http://openbuildservice.org/)
* [OBS as a service](https://build.opensuse.org)
* [Сборка deb-пакетов в OBS](https://en.opensuse.org/openSUSE:Build_Service_Debian_builds)
* [SourceUrls](https://en.opensuse.org/SourceUrls)
* [Сборка руби для вексора от Димы Галинского](https://build.opensuse.org/package/show/home:dmexe:vexor/vx-embeded-ruby-2.1)
