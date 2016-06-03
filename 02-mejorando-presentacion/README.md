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
Las clases de documentos estándares de LaTeX (article, book, etc) poseen estilos
de carátulas propios. Sólo hay que ingresar los datos que se permite (y desea)
incluir y luego generar la carátula.

```latex
\title{Un documento de ejemplo} % Título del documento (obligatorio)
\date{\today} % Fecha del documento, el comando \today inserta la fecha actual
\author{Ing. Huergo\thanks{FIUBA}} % Autor del documento

\maketitle % Genera la carátula
```

El título es obligatorio, mientras que el autor y la fecha son opcionales.
Sin embargo, la fecha se imprime siempre. Si no se ingresa, se imprime la fecha
de generación del documento.

Un "defecto" de la carátula estándar es que imprime el numero de página en ella,
siendo lo normal que no se encuentre numerada.

### Carátula personalizada
Se pueden definir una carátula personalizada, haciendo uso del entorno
`titlepage`.

```latex
\begin{titlepage}

  % Contenido de la carátula personalizada

\end{titlepage}
```

Crear la carátula con el entorno `titlepage` tiene varias ventajas sobre la
carátula estandar de LaTeX:
* Se puede presentar toda la información que se desee.
* Dedica la primer hoja como carátula automáticamente, sin necesidad de agregar
  un salto de página manualmente.
* La página de la carátula no es numerada.

## Tablas

## Gráficos

## Figuras
