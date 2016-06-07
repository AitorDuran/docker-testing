#!/bin/bash

testing=$( curl http://web:80 | grep "This is Phantom, a free, fully responsive site" | wc -l )

if [ $testing -eq 1 ]; then
	echo "El test ha sido finalizado correctamente" 1>&2
	exit 0

elif [ $testing -eq 0 ]; then
 	echo "El test no ha realizado las pruebas correctamente" 1>&2
 	exit 1
fi