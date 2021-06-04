NAME=thesis
FILES = $(shell ls ${NAME}.tex ${NAME}.bib tex/*.tex)

build:
	tectonic ${NAME}.tex
watch: build
	inotifywait --quiet --monitor --event close_write --format %e $(FILES) | while read events; do tectonic ${NAME}.tex; done
clean:
	rm -f ${NAME}.aux ${NAME}.lof ${NAME}.lot ${NAME}.out ${NAME}.run.xml ${NAME}.toc
	rm ${NAME}.pdf ${NAME}.bcf || echo "Already clean"
