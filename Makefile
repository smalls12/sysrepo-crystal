all:
	# build libyang
	git clone --depth=1 https://github.com/CESNET/libyang.git
	mkdir -p libyang/build; \
	cd libyang/build; \
	cmake ..; \
	make; \
	make install

	# build sysrepo
	git clone --depth=1 https://github.com/sysrepo/sysrepo.git
	mkdir -p libyang/build; \
	cd libyang/build; \
	cmake ..; \
	make; \
	make install
	