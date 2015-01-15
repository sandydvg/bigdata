cd /home/vagrant
rm -rf words
mkdir words
cp bigdata/data/alice.txt words
cat words/alice.txt | tr A-Z a-z | tr -cd "a-z\n\t " >words/alice.words.txt
mkdir input
rm -rf input/alice
mkdir input/alice
cp words/alice.words.txt input/alice
mkdir output
rm -rf output/alice
export PATH=$JAVA_HOME/bin:$PATH
export HADOOP_CLASSPATH=$JAVA_HOME/lib/tools.jar

mkdir code
cp bigdata/code/*.java code
hadoop/bin/hadoop com.sun.tools.javac.Main code/WordCount.java
cd code
jar cf wc.jar WordCount*.class
cd ..
hadoop/bin/hadoop jar code/wc.jar WordCount input/alice output/alice
