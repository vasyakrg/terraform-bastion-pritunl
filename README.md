# Безопасный доступ к локальной инфраструктуре
## на примере пакета ritunl-vpn
  * подразумевается, что у вас уже есть проект на GCP, есть созданный bucket для хранения tfstate и собственно установленный на вашей машине terraform (я использовал 0.12.2)
### Что надо подготовить:
  * файл terraform.tfvars.example переименовать в terraform.tfvars и прописать там имя проекта с GCP
  * в файле variables.tf указать кол-ко витруальных машин (если нужно как-то по другому) и регион (если нужен другой)

### Что получаем на выходе
  1. создается правило для фаервола для проброса 443 порта и порта, который сгенериться при установке пакета pritunl (после чего надо в файле main.tf раскомментить в секции **computing port!** описание добавления порта и прописать там верный порт и перезапустить terraform apply)
  2. создается виртуальная машина с установленным пакетом prinunl
  3. создаются три инстанса (меняется в файле variables.tf в переменной count), устанавливается пакет nginx (и в дефолтный файл добавляется имя сервера)

### Подключение
  1. скачиваем [клиента](https://client.pritunl.com/#install) для вашей ОС
  2. по [документации](https://docs.pritunl.com/docs/connecting) настраиваем сервер используя ip-адрес bastion сервера
  3. подключаемся и получаем доступ к локальной сетке и внутренним ресурсам трех созданных машин

### Видео-урок
  * Запись по работе с проектом можно посмотреть [тут](https://youtu.be/dzLYKO_asGI)
  * Этот и много других уроков [тут](vk.com/realmanual)

##### Автор
 - **Vassiliy Yegorov** - *Initial work* - [vasyakrg](https://github.com/vasyakrg)
 - [сайт](vk.com/realmanual)
