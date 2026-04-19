---
title: About
layout: about
permalink: /about.html
# include CollectionBuilder info at bottom
credits: true
# Edit the markdown on in this file to describe your collection
# Look in _includes/feature for options to easily add features to the page
---

{% include feature/jumbotron.html objectid="objects/La_Vanguardia_09-09-1944_page-2_cropped.jpg" %} 

## Sobre el repositorio

Este repositorio contiene el desarrollo de una plataforma digital para la consulta de prensa histórica dentro del marco del proyecto GRESEL-UNED, construida a partir de la plantilla de CollectionBuilder.

El objetivo del proyecto es integrar imágenes digitalizadas de periódicos con sus transcripciones generadas mediante OCR, permitiendo una exploración más accesible e interactiva del contenido. Para ello, se ha personalizado la interfaz mediante HTML y se ha incorporado OpenSeadragon como visor, lo que permite visualizar las páginas en alta resolución y superponer regiones que delimitan los distintos artículos.

Estas regiones han sido anotadas previamente en Transkribus y transformadas de XML a JSON mediante un script en Python, de forma que puedan ser utilizadas en la web. Cada región está conectada con su transcripción, lo que permite al usuario seleccionar una zona concreta de la página y consultar directamente su contenido textual.

Además, se ha implementado un sistema de búsqueda basado en las transcripciones. Para ello, el texto se extrae y se procesa para reconstruir palabras y párrafos afectados por el formato en columnas, generando archivos que permiten localizar términos dentro del corpus.

El repositorio se organiza por periódicos y fechas de publicación, combinando imágenes, datos estructurados y metadatos en un mismo entorno. En conjunto, la plataforma facilita la navegación, la consulta y el análisis de la prensa histórica mediante herramientas de código abierto y de bajo coste de mantenimiento.