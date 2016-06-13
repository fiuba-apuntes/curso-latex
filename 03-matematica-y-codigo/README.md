# Fórmulas matemáticas y código de software

## Índice
* [Fórmulas matemáticas](#fórmulas-matemáticas)
  + [Paquetes para matemáticas](#paquetes-para-matemáticas)
  + [Entornos matemáticos](#entornos-matemáticos)
  + [Símbolos y funciones](#símbolos-y-funciones)
  + [Potencias, índices, raíces y fracciones](#potencias-índices-raíces-y-fracciones)
  + [Matrices](#matrices)
* [Colores](#colores)
  + [Definir colores personalizados](#definir-colores-personalizados)
  + [Formateo con colores](#formateo-con-colores)
* [Código de software](#código-de-software)
  + [Entorno `verbatim`](#entorno-verbatim)
  + [Paquete `listings`](#paquete-listings)
  + [Mejorando el estilo del código fuente](#mejorando-el-estilo-del-código-fuente)
  + [Agregando un subtítulo y etiqueta de referencia](#agregando-un-subtítulo-y-etiqueta-de-referencia)

## Fórmulas matemáticas
Las fórmulas matemáticas son soportadas nativamente por LaTeX y es una de las
motivaciones por las que fue desarrollado el sistema TeX (en el cual se basa
LaTeX), dado que en la época no existían herramientas para generar digitalmente
fórmulas matemáticas con calidad profesional. Actualmente sigue siendo la mejor
herramienta para construir fórmulas matemáticas, potenciada con mejoras
aportadas por paquetes desarrollados por la
[American Mathematical Society](http://www.ams.org) y otros.

A continuación se hará una breve introducción a las expresiones matemáticas en
LaTeX pero es altamente recomendable visitar los siguientes sitios webs:
* [https://en.wikibooks.org/wiki/LaTeX/Mathematics](https://en.wikibooks.org/wiki/LaTeX/Mathematics)
* [https://en.wikibooks.org/wiki/LaTeX/Advanced_Mathematics](https://en.wikibooks.org/wiki/LaTeX/Advanced_Mathematics)

### Paquetes para matemáticas
El desarrollo de documentos matemáticos mejora mucho con la ayuda de paquetes
provistos por la American Mathematical Society (AMS) y otros.

```latex
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{mathtools}
```

El paquete `amsfonts` provee fuentes y símbolos adicionales.
Por ejemplo, para insertar el símbolo que representa a los números reales,
se dispone de la familia de fuentes especial `mathbb`.
Se usa de la forma `\mathbb{R}`, sólo dentro de entornos matemáticos.

El paquete `amssymb` provee un conjunto adicional de símbolos.
**Este paquete carga automáticamente el paquete `amsfonts`, por lo que se
recomienda usar `amssymb` directamente**.

El paquete `amsmath` provee mejoras a los entornos nativos de LaTeX e incluye
los propios, entre otras herramientas útiles.
**Es un paquete prácticamente obligatorio a la hora de trabajar con expresiones
matemáticas**

El paquete `mathtools` resuelve algunos errores del paquete `amsmath` y añade
algunas funcionalidades. El paquete `mathtools` carga el paquete `amsmath` si no
se encuentra cargado previamente.

### Entornos matemáticos
Todas las expresiones matemáticas de desarrollan dentro de un entorno especial
para expresiones matemáticas. En LaTeX existen diversos entornos que se usan de
acuerdo al formato en que se debe imprimir la expresión matemática.

| Tipo                   | Entorno       | Atajo     |
| ---------------------- | ------------- | --------- |
| En línea               | `math`        | `$...$`   |
| Ecuación (sin numerar) | `displaymath` | `\[...\]` |
| Ecuación numerada      | `equation`    | No posee  |

También existe el entorno `equation*` que elimina la numeración de la ecuación,
siendo equivalente al entorno `displaymath`.
Requiere el paquete `amsmath`.

Cuando se escribe dentro de uno de los entornos matemáticos, se dice que está
en el modo matemático.
Este modo tiene algunas diferencias con respecto al modo de texto:
* La mayoría de los espacios y saltos de línea no tienen ningún significado,
  ya que todos los espacios derivan de las expresiones matemáticas, o tienen que
  ser especificado con los comandos especiales como `\quad`.
* No se permiten líneas vacías.
* Cada letra se considera como el nombre de una variable y se compone con los
  estilos especificados para las variables (generalmente cursiva).
  Si desea ingresar texto normal dentro de una fórmula, se lo debe introducir
  con el comando `\text` o cualquiera de los comandos destinados a formatear
  texto como `\textbf`, `\textit`, etc.

### Símbolos y funciones
¡Las matemáticas tienen muchos símbolos! Unos pocos símbolos se pueden ingresar
desde el teclado.

```latex
+ - = ! / ( ) [ ] < > | ' :
```

Para el resto de los símbolos matemáticos se debe ingresar el comando
correspondiente.
Se puede consultar un
[listado de símbolos matemáticos](https://en.wikibooks.org/wiki/LaTeX/Mathematics#List_of_Mathematical_Symbols)
o ayudarse con un editor de textos dedicado para LaTeX.

Como se dijo anteriormente, las letras son interpretadas como nombres de
variables. Para evitar usar el comando de texto cada vez que se desea ingresar
el nombre de una funcion, cada función matemática posee un comando LaTeX.

```latex
\cos (2\theta) = \cos^2 \theta - \sin^2 \theta
```

### Potencias, índices, raíces y fracciones
Las potencias se ingresan con el símbolo `^`, por ejemplo, `k^{n-1}`.

Los índices se ingresan, de manera similar a las potencias, con el símbolo `_`,
por ejemplo, `x_{i+1}`

Se pueden combinar potencias e índices de la siguiente manera `x_{i}^{2}`.
El orden es indistinto, es decir, se puede ingresar primero la potencia y luego
el índice o viseversa.

Las raíces se ingresan con el comando `\sqrt[orden]{...}` donde se ingresa como
argumento el valor al que se le aplica la raíz y se puede ingresar como opción
el nivel de la raíz (por defecto es 2).

Las fracciones se ingresan con el comando `\frac{...}{...}` donde el primer
argumento es el contenido de la parte superior, el segundo argumento es el
contenido de la parte inferior.

### Matrices
Las matrices se ingresan en forma similar a las tablas.

```latex
\begin{matrix}
  a & b & c \\
  d & e & f \\
  g & h & i
\end{matrix}
```

Existe el entorno `matrix*` que permite indicar la alineación del contenido de
cada celda.

```latex
\begin{matrix*}[r]
  -1 & 3  \\
  2  & -4
\end{matrix*}
```

## Colores
LaTeX no soporta nativamente los colores (a excepción de los incluidos con
imágenes), para ello se hace uso del paquete `xcolor`.

```latex
\usepackage[rgb,svgnames,table]{xcolor}
```

El paquete incluye por defecto 19 colores.

Con las opciones se pueden realizar ciertos ajustes al paquete.
* **Modelos de colores:**
  + `rgb` convierte todos los colores al modelo **rgb**. Opción recomendada
    para documentos que se van a distribuir en formato digital.
  + `cmyk` convierte todos los colores al modelo **cmyk**. Opción recomendada
    para documentos que se van a distribuir en formato impreso en papel.
  + `gray` convierte todos los colores al modelo **gray**. Opción recomendada
    para simular o distribuir documentos en blanco y negro.
  * `natural` mantiene todos los colores en su modelo. Opción por defecto del
    paquete.

* **Conjunto de colores:** El paquete carga por defecto 20 colores. Sin embargo,
  mediante opciones se pueden cargar más colores.
  + `dvipsnames` carga un conjunto de 38 colores **cmyk** nombrados según
    [dvips](https://en.wikibooks.org/wiki/LaTeX/Colors#The_68_standard_colors_known_to_dvips).
  + `svgnames` carga un conjunto de 151 colores **rgb** nombrados según la
    [especificación SVG 1.1](http://www.w3.org/TR/SVG11/types.html#ColorKeywords).
  **Es la opción más recomendada a la hora de cargar un conjunto de colores**.
  + `x11names` carga un conjunto de 317 colores **rgb** que básicamente son
    variaciones del subconjunto definido por `svgnames`.
  + `usenames` carga un conjunto de 16 colores **rgb** nombrados según la
    [especificación HTML 4](http://www.w3.org/TR/css3-color/#html4).
    **Esta opción está obsoleta, evitar su uso** (a pesar de que aún se
    encuentran manuales y tutoriales siguen recomendando su uso).
    Todos sus colores se encuentran incluidos en la opción `svgnames`.

* **Soporte para otros paquetes:** Indica que se va a utilizar otro paquete que
  puede requerir soporte para los colores.
  + `table` añade soporte para las tablas, permitiendo colorear filas, columnas
    y celdas dentro de las tablas.
  + `hyperref` añade soporte para el paquete `hyperref`.

### Definir colores personalizados
Se pueden definir colores personalizados. Se recomienda hacerlo en el preambulo
del archivo LaTeX.

```latex
\definecolor{nombrecolorpersonalizado}{modelo}{especificacioncolor}
```

* `nombrecolorpersonalizado` el nombre del nuevo color.
* `modelo` con el cual se va a describir el color. Puede ser gray, rgb, RGB,
  HTML y cmyk.
* `especificacioncolor` define el color según el modelo seleccionado.

| Modelo | Descripcion              | Especificación de color                                                       | Ejemplo                                |
| ------ | ------------------------ | ----------------------------------------------------------------------------- | -------------------------------------- |
| `gray` | Tono de gris (0-1)       | Número entre 0 (negro) y 1 (blanco)                                           | `\definecolor{light-gray}{gray}{0.95}` |
| `rgb`  | Red, Green, Blue (0-1)   | Tres números entre 0 y 1 que representan la cantidad de rojo, verde y azul    | `\definecolor{orange}{rgb}{1,0.5,0}`   |
| `RGB`  | Red, Green, Blue (0-255) | Tres números entre 0 y 255 que representan la cantidad de rojo, verde y azul  | `\definecolor{orange}{RGB}{255,127,0}` |
| `HTML` | Red, Green, Blue (00-FF) | Seis números hexadecimales que forman RRGGBB, similar a la definicion en HTML | `\definecolor{orange}{HTML}{FF7F00}`   |
| `cmyk` | Cyan, Magenta, Yellow, Black (0-1) | Cuatro números entre 0 y 1 que representa la cantidad de cyan, magenta, yellow y black | `\definecolor{orange}{cmyk}{0,0.5,1,0}` |

También se puede definir colores como mezcla de los colores previamente definidos

```latex
\colorlet{colornuevo}{blue!20} % 20% azul y 80% blanco
\colorlet{colornuevo}{blue!20!black} % 20% azul y 80% negro
```

### Formateo con colores

#### Texto

```latex
{\color{red} Grupo de texto con color rojo}

\textcolor{blue}{Comando con color azul para texto}
```

#### Fondo de texto

```latex
\colorbox{green}{Texto con fondo verde}

\colorbox{black}{\color{white} Texto blanco con fondo negro}

\fcolorbox{red}{white}{Texto con borde de color rojo}

\fcolorbox{blue}{green}{Texto con borde de color azul y fondo verde}
```

## Código de software
Cuando se incluye código fuente de un software, se espera que el texto se
formatee con una tipografía monoespaciada, respete los espacios de la
indentación, entre otras cosas.

### Entorno `verbatim`
Es un entorno simple que formatea el texto que se encuentra dentro del mismo
con una fuente monoespaciada y mantiene los espacios ingresados.

```latex
\begin{verbatim}
#include<stdio.h>
main() {
    printf("Hello World");
}
\end{verbatim}
```

### Paquete `listings`
Es uno de los paquetes más populares para introducir código fuente a los
documentos, ya que es muy flexible y personalizable.

```latex
\usepackage{listings}
```

Proporciona un entorno que se usa en forma similar a `verbatim`.

```latex
\begin{lstlisting}
#include<stdio.h>
main() {
    printf("Hello World");
}
\end{lstlisting}
```

Sin embargo, el paquete provee la posibilidad de importar el código directamente
desde el archivo fuente.

```latex
\lstinputlisting{main.c}
```

Este comando puede recibir opciones.

```latex
\lstinputlisting[language=C, firstline=5, lastline=7]{main.c}
```

### Mejorando el estilo del código fuente
Por defecto el código fuente se ingresa en blanco y negro.
Sin embargo, se suele mejorar la presentación añadiendo número de líneas,
colorear sintaxis, etc.

Para ello se puede configurar `listings` con el comando `lstset` (recordar
hacerlo en el preambulo).

```latex
\lstset{ % Defino el formato de bloques de código fuente
  inputencoding=utf8, % Indico la codificación de los archivos de entrada
  extendedchars=true, % Extiendo los caracteres
  % Escapeo caracteres especiales
  literate={á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1 {ñ}{{\~n}}1,
  inputpath={codigo}, % Defino la ruta en la que se encuentran los archivos
  showtabs=true, % Indica si se muestran los tabs
  tab=\rightarrowfill, % Indica el caracter con el que se va a mostrar el tab
  tabsize=2, % Indica la cantidad de espacios que ocupa un tab
  showspaces=true, % Indica si muestra los espacios
  showstringspaces=false, % Indica si muestra los espacios dentro de strings
  numbers=left, % Posición en que se muestran los números de línea
  numberstyle=\tiny\color{gray}, % Estilo de los números de línea
  breaklines=true, % Se parten las líneas que exceden del ancho del documento
  frame=single, % Formato del marco del entorno
  backgroundcolor=\color{gray!5}, % Color de fondo
  basicstyle=\ttfamily\footnotesize, % Estilo de base (familia, tamaño, color)
  keywordstyle=\color{DarkBlue}, % Estilo de las palabras reservadas
  stringstyle=\color{red}, % Estilo de los strings
  commentstyle=\color{DarkGreen}, % Estilo de los comentarios
  language=C, % Espeficica el lenguaje a usar
  otherkeywords={std,cout} % Agrego palabras reservadas que no se resaltan
}
```

Si embargo, toda esa configuración es global para todo el documento.
Es decir, todo el código presentado en el documento va a tener el mismo estilo.
Suele ocurrir que distintos lenguajes tienen combinaciones de colores distintos
para el resaltado de sintaxis.
Para resolver esto, se pueden definir diferentes estilos con el comando
`\lstdefinestyle` para cada lenguaje, pudiendo mantener cierta configuración
de forma global dentro de `lstset`.

```latex
\lstset{ % Defino el formato de bloques de código fuente
  inputencoding=utf8, % Indico la codificación de los archivos de entrada
  extendedchars=true, % Extiendo los caracteres
  % Escapeo caracteres especiales
  literate={á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1 {ñ}{{\~n}}1,
  inputpath={codigo}, % Defino la ruta en la que se encuentran los archivos
  showstringspaces=false, % Indica si muestra los espacios dentro de strings
  numbers=left, % Posición en que se muestran los números de línea
  numberstyle=\tiny\color{gray}, % Estilo de los números de línea
  breaklines=true, % Se parten las líneas que exceden del ancho del documento
  frame=single, % Formato del marco del entorno
  backgroundcolor=\color{gray!5}, % Color de fondo
  basicstyle=\ttfamily\footnotesize, % Estilo de base (familia, tamaño, color)
}

\lstdefinestyle{cpp}{
  tabsize=4,
  language=C++,
  keywordstyle=\color{DarkGreen}, % Estilo de las palabras reservadas
  stringstyle=\color{DarkBlue}, % Estilo de los strings
  commentstyle=\color{DarkGray}, % Estilo de los comentarios
  otherkeywords={std,cout} % Agrego palabras reservadas que no se resaltan
}

\lstdefinestyle{ruby}{
  language=Ruby,
  keywordstyle=\color{DarkMagenta}, % Estilo de las palabras reservadas
  stringstyle=\color{DarkBlue}, % Estilo de los strings
  commentstyle=\color{DarkGray} % Estilo de los comentarios
}
```

Al usar un entorno o importar un archivo, se define el estilo a usar con la
opción `style`.

```latex
\lstinputlisting[style=cpp]{main.cpp}

\lstinputlisting[style=ruby]{script.rb}
```

### Agregando un subtítulo y etiqueta de referencia
De forma similar a otros objetos flotantes de LaTeX, los listados de código
son automáticamente numerados según el `caption` definido.
El `label` sirve para darle al listado un indicador único y poder
ser referido a él en el cuerpo de un texto con el comando `\ref{lst:codigo}`,
que inserta el número correspondiente a esa figura.
El identificador de `label` puede ser cualquier texto, pero por
convención, se le añade el prefijo **lst:** para reconocer rápidamente que
se está referenciando a un listado de código, útil cuando se utilizan
referencias a diferente tipo de objetos.

En otros objetos hemos visto que `capation` y `label` se ingresa mediante
comandos. Sin embargo, para el listado de código, ambos datos se ingresan
mediante las opciones.

```latex
\begin{lstlisting}[caption={Código C},label={lst:codigoc}]
/* Hello World program */

#include<stdio.h>

main() {
    printf("Hello World");
}
\end{lstlisting}

\lstinputlisting[
  style=ruby,
  caption={Código Ruby},
  label={lst:codigoruby}
]{script.rb}
```

Con el comando `\lstlistoflistings` se puede agregar un índice de todos los
listados de código que se encuentran en el documento.

**Observación:** por defecto el nombre del listado de código usado por `caption`
es _Listing_ y el título del índice de listado de código es _Listings_.
Si se usa el paquete _babel_ configurado en el idioma español (es decir,
`\usepackage[spanish]{babel}`), los nombres no se traducen (no se encuentran
definidas versiones españolas para esos nombres).

Si se desea darle otro nombre tanto al subtítulo como al titulo del índice,
basta con renombrarlos en el preambulo del archivo.

```latex
\addto\captionsspanish{
  \renewcommand\lstlistingname{Código}
  \renewcommand\lstlistlistingname{Lista de código}
}
```
