# Mejorando la presentación

## Indice
* [Tabla de contenidos](#tabla-de-contenidos)
* [Caratula](#caratula)
  + [Caratula personalizada](#caratula-personalizada)
* [Gráficos](#gráficos)
  + [Tipos de gráficos](#tipos-de-gráficos)
  + [Paquete `graphicx`](#paquete-graphicx)
  + [Formato de imágenes soportados](#formato-de-imágenes-soportados)
  + [Incluir gráficos en el documento](#incluir-gráficos-en-el-documento)
  + [Entorno de Figuras](#entorno-de-figuras)
* [Tablas](#tablas)

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

**Observación:** por defecto el título del índice es _Contents_.
Si se usa el paquete _babel_ configurado en el idioma español (es decir,
`\usepackage[spanish]{babel}`), el título del índice se traduce a _Índice_.

## Caratula
Las clases de documentos estándares de LaTeX (article, book, etc) poseen estilos
de caratulas propios. Sólo hay que ingresar los datos que se permite (y desea)
incluir y luego generar la caratula.

```latex
\title{Un documento de ejemplo} % Título del documento (obligatorio)
\date{\today} % Fecha del documento, el comando \today inserta la fecha actual
\author{Ing. Huergo\thanks{FIUBA}} % Autor del documento

\maketitle % Genera la caratula
```

El título es obligatorio, mientras que el autor y la fecha son opcionales.
Sin embargo, la fecha se imprime siempre. Si no se ingresa, se imprime la fecha
de generación del documento.

Un "defecto" de la caratula estándar es que imprime el numero de página en ella,
siendo lo normal que no se encuentre numerada.

### Caratula personalizada
Se pueden definir una caratula personalizada, haciendo uso del entorno
`titlepage`.

```latex
\begin{titlepage}

  % Contenido de la caratula personalizada

\end{titlepage}
```

Crear la caratula con el entorno `titlepage` tiene varias ventajas sobre la
caratula estandar de LaTeX:
* Se puede presentar toda la información que se desee.
* Dedica la primer hoja como caratula automáticamente, sin necesidad de agregar
  un salto de página manualmente.
* La página de la caratula no es numerada.

## Gráficos

### Tipos de gráficos
Previamente debemos distinguir los tipos de imágenes que existen:
* **[Imagen de píxeles o mapa de bits](https://es.wikipedia.org/wiki/Imagen_de_mapa_de_bits):**
  Representa la imagen con una matriz de los colores de cada pixel.
  Algunos formatos populares:
  [JPG](https://es.wikipedia.org/wiki/Joint_Photographic_Experts_Group),
  [PNG](https://es.wikipedia.org/wiki/Portable_Network_Graphics).

* **[Imágenes vectoriales](https://es.wikipedia.org/wiki/Gr%C3%A1fico_vectorial):**
  Representa la imagen con objetos geométricos independientes (segmentos,
  polígonos, arcos, etc.), cada uno de ellos definido por distintos atributos
  matemáticos de forma, de posición, de color, etc. Algunos formatos populares:
  [PDF](https://es.wikipedia.org/wiki/PDF),
  [EPS](https://es.wikipedia.org/wiki/PostScript_encapsulado).

### Paquete `graphicx`
LaTeX no provee funcionalidad nativa para incluir gráficos a los documentos.
Para ello se debe incluir el paquete `graphicx` en el preámbulo.

```latex
\usepackage{graphicx}
```

### Formato de imágenes soportados
Las distribuciones de LaTeX suelen traer varios compiladores de archivos, cada
uno con sus características. En particular, cada compilador es compatible con
ciertos formatos de imágenes que pueden no serlo en otro compilador.

* _latex_: Este compilador sólo es compatible con el formato EPS.
  Para compilar con _latex_ será necesario convertir previamente las imágenes
  al formato EPS.

* _pdflatex_: Este compilador es compatible con JPG, PNG, PDF y EPS.

### Incluir gráficos en el documento
Una vez cargado el paquete `graphicx` en el preámbulo, las imágenes se incluyen
con el siguiente comando:

```latex
\includegraphics[atributo1=valor1,...,atributon=valorn]{nombre_imagen}
```

El nombre de la imagen se escribe sin la extensión del formato.
Si se poseen múltiples formatos de una misma image, LaTeX elegirá el formato
adecuado según el contexto.

Las opciones más populares para ajustar un gráfico:

| Option         | Comentario                                                    |
| -------------- | ------------------------------------------------------------- |
| `width=xx`     | Especifica el ancho preferido de la imagen a xx               |
| `height=xx`    | Especifica el alto preferido de la imagen a xx                |
| `scale=xx`     | Escala la imagen al factor de escala xx                       |
| `angle=xx`     | Rota la imagen en un ángulo de xx grados (hacia la izquierda) |
| `resolution=x` | Espeficica la resolución de impresión a x dpi                 |

El orden en que son ingresadas las opciones es importante, caso contrario se
pueden ignorar algunas opciones o no incluir la imagen en el documento.

Por defecto, las imágenes son buscadas en el mismo directorio en el que se
encuentra el archivo `.tex` que LaTeX está compilando.
Si se almacenan las imágenes en un directorio diferente, se ofrece el comando
`graphicspath` para indicar otros directorios donde LaTeX puede tomar las imágenes.

```latex
\graphicspath{ {/var/lib/images/} } % Ruta absoluta Unix
\graphicspath{ {imagenes/}{./recursos/} } % Rutas relativas
\graphicspath{ {c:\mypict~1\camera} } % Ruta absoluta Windows
\graphicspath{ {c:/mypict~1/camera/} } % Funciona en Win XP en adelante
```

### Entorno de Figuras
El entorno figura (que no es exclusivo para imágenes) permite agregar un
subtítulo y una referencia a la figura mostrada.

```latex
\begin{figure}
  \includegraphics[width=0.6\textwidth]{imagen}
  \caption{Imagen}
  \label{fig:imagen}
\end{figure}
```

Las figuras son automáticamente numeradas según el comando `\caption` y pueden
ser referidas a ellas en el cuerpo de un texto con el comando `\ref{fig:imagen}`,
que inserta el número correspondiente a esa figura.

Con el comando `\listoffigures` se puede agregar una lista de todas las figuras
que se encuentran en el documento.

El entorno de figura es reconocido por LaTeX como un elemento flotador.
Un flotador es un contenedor de cosas que no se pueden fraccionar en una página.
Esto significa que si un elemento flotador no entra en una página, se insertará
en otra, según la configuración.

El entorno de figura permite configurar con una opción el indicador de la posición.

```latex
\begin{figure}[p]
  ···
\end{figure}
```

| Indicador | Comentario                                                       |
| --------- | ---------------------------------------------------------------- |
| `h`       | Coloca aproximadamente en el mismo lugar donde se introduce en el texto original |
| `t`       | Coloca en la parte superior (_top_) de la página                 |
| `b`       | Coloca en la parte inferior (_bottom_) de la página              |
| `p`       | Inserta la figura en una página especial de objetos flotadores   |
| `!`       | Sobrescribe el parámetro de LaTeX que determina la mejor ubicación de los flotadores |
| `H`       | Coloca el flotador en el mismo lugar en el código LaTeX. Requiere el paquete `float`. |

Hay muchas posibilidades para posicionar las figuras como, por ejemplo, posicionar
la figura con texto alrededor. Muchos casos requieren paquetes adicionales y se
puede conocer su uso en el
[Wikibook de LaTeX](https://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions).

**Observación:** por defecto el nombre de la figura usado por `\caption` es
_Figure_ y el título del índice de figuras es _List of Figures_.
Si se usa el paquete _babel_ configurado en el idioma español (es decir,
`\usepackage[spanish]{babel}`), el nombre usado por `\caption` es _Figura_ y
el título del índice de figuras se traduce a _Índice de figuras_.

## Tablas
