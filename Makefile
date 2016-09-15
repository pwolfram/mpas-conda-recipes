# Automate rebuilding lots of things

netcdf:
	cd netcdf-base && conda-build .
	cd netcdf-fortran && conda-build .
	cd netcdf-cxx && conda-build .

package-mpfr:
	cd mpfr && conda-build .

package-cgal: 
	cd cgal && conda-build .


package-python-cgal-bindings: 
	cd python-cgal-bindings && conda-build .
