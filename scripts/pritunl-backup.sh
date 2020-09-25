# pritunl-backup.sh
sudo service pritunl stop
mongodump -d pritunl -o pritunl-bkp
tar -czvf pritunl-bkp.tar.gz pritunl-bkp


# pritunl-restore.sh
sudo service pritunl stop
mongo pritunl --eval 'db.dropDatabase()'
tar -xzf pritunl-bkp.tar.gz
mongorestore -d pritunl ./pritunl-bkp/pritunl/
sudo service pritunl start
