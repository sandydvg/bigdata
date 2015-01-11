cd /home/vagrant
sudo apt-get -y install default-jdk
sudo apt-get -y install ssh
sudo apt-get -y install rsync
if [ ! -d /home/vagrant/hadoop ] ; then
  echo "DOWNLOADING HADOOP"
  wget http://mirror.metrocast.net/apache/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz
  tar -zxvf hadoop-2.6.0.tar.gz
  mv hadoop-2.6.0 /home/vagrant/hadoop
fi
cp -f bigdata/hadoop/etc/hadoop/* hadoop/etc/hadoop
cd hadoop
mkdir input
mkdir output
mkdir input/sample
cp etc/hadoop/*.xml input/sample
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.6.0.jar grep input/sample output/sample 'dfs[a-z.]+'
cat output/sample/*
cd /home/vagrant

