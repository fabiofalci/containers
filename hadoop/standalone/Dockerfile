FROM hadoop-base

# Pseudo-Distributed Operation
RUN echo -e "<configuration>\n<property>\n<name>fs.defaultFS</name>\n<value>hdfs://localhost:9000</value>\n</property>\n</configuration>" > /etc/hadoop/core-site.xml \
	&& echo -e "<configuration>\n<property>\n<name>dfs.replication</name>\n<value>1</value>\n</property>\n</configuration>" > /etc/hadoop/hdfs-site.xml \
	&& echo -e "<configuration>\n<property>\n<name>mapreduce.framework.name</name>\n<value>yarn</value>\n</property>\n</configuration>" > /etc/hadoop/mapred-site.xml \
	&& echo -e "<configuration>\n<property>\n<name>yarn.nodemanager.aux-services</name>\n<value>mapreduce_shuffle</value>\n</property>\n</configuration>" > /etc/hadoop/yarn-site.xml

RUN echo "\$HADOOP_PREFIX/bin/hdfs namenode -format" >> /start.sh \
	&& echo "\$HADOOP_PREFIX/sbin/hadoop-daemon.sh start namenode" >> /start.sh \
	&& echo "\$HADOOP_PREFIX/sbin/hadoop-daemon.sh start datanode" >> /start.sh \
	&& echo "\$HADOOP_PREFIX/sbin/hadoop-daemon.sh start secondarynamenode" >> /start.sh \
	&& echo "\$HADOOP_PREFIX/sbin/hadoop-daemon.sh start journalnode" >> /start.sh \
	&& echo "\$HADOOP_PREFIX/sbin/yarn-daemon.sh start resourcemanager" >> /start.sh \
	&& echo "\$HADOOP_PREFIX/sbin/yarn-daemon.sh start nodemanager" >> /start.sh \
	&& echo "\$HADOOP_PREFIX/sbin/yarn-daemon.sh start proxyserver" >> /start.sh \
	&& chmod +x /start.sh