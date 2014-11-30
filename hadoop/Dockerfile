FROM archlinux-aur

RUN pacman -Syu --noconfirm
RUN yaourt -S hadoop openssh --noconfirm

RUN echo "export JAVA_HOME=/usr/lib/jvm/default" >> /etc/profile.d/java.sh \
	&& echo "export HADOOP_PREFIX=/usr/lib/hadoop" >> /etc/profile.d/hadoop.sh

RUN /usr/bin/ssh-keygen -A \
	&& sed 's@session\s*include\s*system-remote-login@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

RUN chown -R hadoop /usr/lib/hadoop-2.5.2
