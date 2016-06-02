# Mejorando la presentación

## Indice
* [Tabla de contenidos](#tabla-de-contenidos)
* [Carátula](#caratula)
* [Tablas](#tablas)
* [Gráficos](#graficos)
* [Figuras](#figuras)

## Tabla de contenidos
Para incluir un índice de contenido al documento LaTeX, sólo hay que invocar al
comando `\tableofcontents`. En la tabla de contenido se incluirán todos los
títulos de las secciones que se encuentran a lo largo del archivo.

Puede ocurrir el caso en que el título de una sección puede ser demasiado largo
para la tabla de contenidos. Todos los comandos de secciones pueden recibir como
opción una versión diferente del título para la tabla de contenidos.

```latex
\section[version reducida]{nombre de la sección}
```

La tabla de contenido sólo muestra las secciones numeradas. En caso de que se
quiera incluir una sección no numerada, hay que incluirla manualmente.

```latex
\section*{Introducción}
\addcontentsline{toc}{section}{Introducción}
```

## Carátula

## Tablas

## Gráficos

## Figuras
