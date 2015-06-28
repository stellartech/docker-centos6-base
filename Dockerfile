FROM	centos:6
MAINTAINER	Andy Kirkham <andy@spiders-lair.com>

RUN	yum -y update && yum clean all \
	&& yum -y install wget curl tar rpm \
	&& rpm -ivh http://dl.iuscommunity.org/pub/ius/stable/CentOS/6/x86_64/epel-release-6-5.noarch.rpm \
	&& rpm -ivh http://dl.iuscommunity.org/pub/ius/stable/CentOS/6/x86_64/ius-release-1.0-11.ius.centos6.noarch.rpm \
	&& yum -y groupinstall 'Development Tools' \
	&& yum -y install bzip2 bzip2-devel \
	&& yum -y install libcurl-devel t1lib-devel mcrypt libmcrypt libmcrypt-devel \
	&& yum -y install libxml2 openssl-devel libxml2-devel libtool-ltdl-devel \
	&& yum -y install autoconf213 cmake \
	&& yum -y install unixODBC unixODBC-devel libsodium libsodium-devel \
	&& yum -y install mysql55 mysql55-libs mysqlclient16-devel mysql55-devel \
	&& wget https://github.com/akheron/jansson/archive/v2.7.zip \
		&& unzip v2.7.zip && rm -f v2.7.zip \
		&& cd jansson-2.7 \
		&& sh autoreconf -i && ./configure && make && make install \
		&& cd .. && rm -rf jansson-2.7 \
	&& wget https://github.com/nmathewson/Libevent/archive/release-2.0.22-stable.zip \
		&& unzip release-2.0.22-stable.zip && rm -f release-2.0.22-stable.zip \
		&& cd Libevent-release-2.0.22-stable \
		&& sh autogen.sh && ./configure && make && make install \
		&& cd .. && rm -rf Libevent-release-2.0.22-stable \
	&& wget https://github.com/ellzey/libevhtp/archive/1.2.10.zip \
		&& unzip 1.2.10.zip && rm -f 1.2.10.zip && mkdir -p libevhtp-1.2.10/build \
		&& cd libevhtp-1.2.10/build \
		&& cmake .. && make && make install && cd .. && rm -rf libevhtp-1.2.10 \
	&& wget http://memcached.org/files/memcached-1.4.24.tar.gz \
		&& tar -zxf memcached-1.4.24.tar.gz && rm -f memcached-1.4.24.tar.gz \
		&& cd memcached-1.4.24 \
		&& ./configure && make && make install && cd ~ && rm -rf memcached-1.4.24 \
	&& wget https://github.com/zeromq/zeromq3-x/archive/v3.2.5.zip \
		&& unzip v3.2.5.zip && rm -f v3.2.5.zip \
		&& cd zeromq3-x-3.2.5 \
		&& sh autogen.sh && ./configure && make && make install \
		&& cd ~ && rm -rf zeromq3-x-3.2.5 \
	&& wget https://github.com/zeromq/czmq/archive/v3.0.2.zip \
		&& unzip v3.0.2.zip && rm -f v3.0.2.zip \
		&& cd czmq-3.0.2 \
		&& sh autogen.sh && ./configure && make && make install \
		&& cd ~ && rm -rf czmq-3.0.2 \
	&& wget https://github.com/pocoproject/poco/archive/poco-1.6.0-release.zip \
		&& unzip poco-1.6.0-release.zip && rm -f poco-1.6.0-release.zip \
		&& cd poco-poco-1.6.0-release \
		&& ./configure \
			--config=Linux --omit=PageCompiler \
			--static --shared --no-samples --no-tests \
		&& make && make install \
		&& cd ~ && rm -rf poco-poco-1.6.0-release 

