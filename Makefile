# Automate rebuilding lots of things

all: netcdf env parallelnetcdf pio

netcdf:
	cd netcdf-base && conda-build .
	cd netcdf-fortran && conda-build .
	cd netcdf-cxx && conda-build .

env:
	grep "\- /" modfiles | awk '{print $2}' > ~/.default_edison_module
	module -l list &> ~/.default_edison_list

parallelnetcdf: netcdf env
	cd parallel-netcdf && conda-build .

pio: env netcdf parallelnetcdf
	cd pio && conda-build .
