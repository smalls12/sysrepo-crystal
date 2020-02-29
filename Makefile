all:
	# build libyang
	git clone --depth=1 https://github.com/CESNET/libyang.git
	mkdir -p libyang/build; \
	cd libyang/build; \
	cmake ..; \
	make; \
	export PATH=$PATH:$PWD/

	# build sysrepo
	git clone --depth=1 https://github.com/sysrepo/sysrepo.git
	mkdir -p sysrepo/build; \
	cd sysrepo/build; \
	cmake ..; \
	make; \
	export PATH=$PATH:$PWD/
	