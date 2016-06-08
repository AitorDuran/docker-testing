#!/bin/bash

#testing=$( curl http://web:80 | grep "This is Phantom, a free, fully responsive site" | wc -l )

if curl http://web:80 | grep "This is Phantom, a free, fully responsive site" ; then
	echo "El test ha sido finalizado correctamente" 
	exit 0

else
 	echo "El test no ha realizado las pruebas correctamente" 
 	exit 1
fi
