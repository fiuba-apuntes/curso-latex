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
  + [Entorno `table`](#entorno-table)

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

Las figuras son automáticamente numeradas según el comando `\caption`.
El comando `\label` sirve para darle a la figura un indicador único y poder
ser referida a ella en el cuerpo de un texto con el comando `\ref{fig:imagen}`,
que inserta el número correspondiente a esa figura.
El identificador dentro de `\label` puede ser cualquier texto, pero por
convención, se le añade el prefijo **fig:** para reconocer rápidamente que
se está referenciando a una figura, útil cuando se utilizan referencias a
diferente tipo de objetos.

Con el comando `\listoffigures` se puede agregar una lista de todas las figuras
que se encuentran en el documento.

El entorno de figura es reconocido por LaTeX como un objeto flotante.
Un objeto flotante es un contenedor de cosas que no se pueden fraccionar en una
página.
Esto significa que si un objeto flotante no entra en una página, se insertará
en otra ubicación, según la configuración.

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
| `p`       | Inserta la figura en una página especial de objetos flotantes    |
| `!`       | Sobrescribe el parámetro de LaTeX que determina la mejor ubicación de los objetos flotantes |
| `H`       | Coloca el objeto flotante en el mismo lugar en el código LaTeX. Requiere el paquete `float`. |

Hay muchas posibilidades para posicionar las figuras como, por ejemplo, posicionar
la figura con texto alrededor. Muchos casos requieren paquetes adicionales y se
puede conocer su uso en el
[Wikibook de LaTeX](https://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions).

**Observación:** por defecto el nombre de la figura usado por `\caption` es
_Figure_ y el título del índice de figuras es _List of Figures_.
Si se usa el paquete _babel_ configurado en el idioma español (es decir,
`\usepackage[spanish]{babel}`), el nombre usado por `\caption` es _Figura_ y
el título del índice de figuras se traduce a _Índice de figuras_.

Si se desea darle otro nombre tanto al subtítulo como al titulo del índice,
basta con renombrarlos en el preambulo del archivo.

```latex
\addto\captionsspanish{
  \renewcommand\figurename{Gráfico}
  \renewcommand\listfigurename{Lista de gráficos}
}
```

## Tablas
Las tablas se construyen dentro del entorno `tabular` con un formato particular.

```latex
\begin{tabular}{formato}
···
\end{tabular}
```

El argumento `formato` indica la alineación de cada columna y las líneas
verticales de las columnas.

Los símbolos admitidos para especificar el formato son

| Símbolo    | Significado                                                     |
| ---------- | --------------------------------------------------------------- |
| `l`        | Columna justificada hacia la izquierda                          |
| `c`        | Columna centrada                                                |
| `r`        | Columna justificada hacia la derecha                            |
| `p{ancho}` | Columna con párrafo alineado verticalmente hacia arriba         |
| `m{ancho}` | Columna con párrafo alineado verticalmente en el centro. Requiere el paquete `array`. |
| `b{ancho}` | Columna con párrafo alineado verticalmente hacia abajo. Requiere el paquete `array`. |
| `|`        | Línea vertical                                                  |
| `||`       | Doble línea vertical                                            |

Por defecto, LaTeX hará que las filas ocupen una sola línea. En caso de que el
texto sea más largo del ancho de la página, la tabla se excedería de la página,
mostrandose incompleta. Para eso se usan los símbolos `p`, `m` y `b`, junto con
el ancho de la fila.

El contenido del entorno `tabular` debe tener un formato construido con los
simbolos que separan entre columnas, inician una fila, etc.

| Símbolo       | Significado                                                  |
| ------------- | ------------------------------------------------------------ |
| `&`           | Separador de columna                                         |
| `\\`          | Inicia una nueva fila                                        |
| `\hline`      | Línea horizontal                                             |
| `\newline`    | Inicia una nueva línea dentro de una celda                   |
| `\cline{i-j}` | Línea horizontal parcial entre la columna `i` y la columna `j` |

Un ejemplo de una tabla con una fila encabezado y todos los bordes.

```latex
\begin{tabular}{| l | c | r |}
\hline
Alpha & Beta & Gama \\
\hline \hline
1 & 2 & 3 \\
\hline
4 & 5 & 6 \\
\hline
\end{tabular}
```

Las tablas son muy personalizables y existen multitud de paquetes adicionales
para mejorar el formato y estilo de las mismas.
Pueden conocer más funcionalidades en el
[Wikibook de LaTeX](https://en.wikibooks.org/wiki/LaTeX/Tables).

### Entorno `table`
Al igual que el entorno `figure`, el entorno `table` es un objeto flotante al
que se le puede agregar un subtitulo y una referencia, como también ajustar
su posicionamiento.

```latex
\begin{table}[h]
  \centering
  \begin{tabular}{formato}
    ···
  \end{tabular}
  \caption{Tabla de ejemplo}
  \label{tab:tabla}
\end{table}
```

Las tablas son automáticamente numeradas según el comando `\caption`.
El comando `\label` sirve para darle a la tabla un indicador único y poder
ser referida a ella en el cuerpo de un texto con el comando `\ref{tab:tabla}`,
que inserta el número correspondiente a esa tabla.
El identificador dentro de `\label` puede ser cualquier texto, pero por
convención, se le añade el prefijo **tab:** para reconocer rápidamente que
se está referenciando a una tabla, útil cuando se utilizan referencias a
diferente tipo de objetos.

Con el comando `\listoftables` se puede agregar una lista de todas las tablas
que se encuentran en el documento.

**Observación:** por defecto el nombre de la tabla usado por `\caption` es
_Table_ y el título del índice de figuras es _List of Tables_.
Si se usa el paquete _babel_ configurado en el idioma español (es decir,
`\usepackage[spanish]{babel}`), el nombre usado por `\caption` es _Cuadro_ y
el título del índice de figuras se traduce a _Índice de cuadros_.

Si se desea darle otro nombre tanto al subtítulo como al titulo del índice,
basta con renombrarlos en el preambulo del archivo.

```latex
\addto\captionsspanish{
  ···
  \renewcommand\tablename{Tabla}
  \renewcommand\listtablename{Lista de tablas}
}
```
