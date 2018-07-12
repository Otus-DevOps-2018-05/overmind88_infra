# overmind88_infra
overmind88 Infra repository

#ДЗ №3

bastion_IP = 35.204.213.127  
someinternalhost_IP = 10.164.0.3

Подключение к someinternalhost в одну строчку:

`ssh -i ~/.ssh/appuser -A overmind88@35.204.213.127 -t ssh 10.164.0.3`

Подключение по алиасу someinternalhost:

В ~/.ssh/config прописать следующее:

```
Host someinternalhost
    HostName 10.164.0.3
    ForwardAgent yes
    User overmind88
    ProxyCommand ssh overmind88@35.204.213.127 nc %h %p
```

#ДЗ №4

testapp_IP = 35.205.80.235
testapp_port = 9292 

Команда для добавления правила файрволла: 
`gcloud compute firewall-rules create puma-default-server --target-tags="puma-server" --source-ranges="0.0.0.0/0" --allow tcp:9292`

Команда для запуска со startup-скриптом:

```
gcloud compute instances create reddit-app-2\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata-from-file startup-script=startup.sh

```

#ДЗ №5

Что было сделано:
- написал конфиг для packer-base, проверена его работоспособность, сделал VM на его основе и установил туда reddit-app
- добавил дополнительные параметры в конфиг packer, сделал файл с примером для переменных
- написал конфиг для packer-full, который использует packer-base и просто устанавливает в него приложение и настраивает его автозапуск с помощью systemd-unit, проверил его работоспособность, отладил возникшие проблемы

# ДЗ №6
Что было сделано:
- создано описание инфраструктуры для приложения reddit-app в terraform, с помощью provisioner's сделано разворачивание приложения
- добавлены дополнительные переменные в конфигурацию согласно самостоятельному заданию
- применён terraform fmt к файлам
- добавлен файл с примером переменных
- добавлены ssh-ключи для пользователей из доп. задания
- проверено, что происходит при выполнении terraform apply если был добавлен ещё один ключ через веб-интерфейс. Добавленный вручную ключ удаляется, остаётся конфигурация, соответствующая описаной в terraform
