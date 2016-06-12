# Fórmulas matemáticas y código de software

## Índice
* [Fórmulas matemáticas](#fórmulas-matemáticas)
  + [Paquetes de la AMS](#paquetes-de-la-ams)
  + [Entornos matemáticos](#entornos-matemáticos)
  + [Símbolos y funciones](#símbolos-y-funciones)
  + [Potencias, índices, raíces y fracciones](#potencias-índices-raíces-y-fracciones)
  + [Matrices](#matrices)
* [Colores](#colores)
  + [Definir colores personalizados](#definir-colores-personalizados)
  + [Formateo con colores](#formateo-con-colores)
* [Código de software](#código-de-software)

## Fórmulas matemáticas
Las fórmulas matemáticas son soportadas nativamente por LaTeX y es una de las
motivaciones por las que fue desarrollado el sistema TeX (en el cual se basa
LaTeX), dado que en la época no existían herramientas para generar digitalmente
fórmulas matemáticas con calidad profesional. Actualmente sigue siendo la mejor
herramienta para construir fórmulas matemáticas, potenciada con mejoras
aportadas por paquetes desarrollados por la
[American Mathematical Society](http://www.ams.org)

A continuación se hará una breve introducción a las expresiones matemáticas en
LaTeX pero es altamente recomendable visitar los siguientes sitios webs:
* [https://en.wikibooks.org/wiki/LaTeX/Mathematics](https://en.wikibooks.org/wiki/LaTeX/Mathematics)
* [https://en.wikibooks.org/wiki/LaTeX/Advanced_Mathematics](https://en.wikibooks.org/wiki/LaTeX/Advanced_Mathematics)

### Paquetes de la AMS
El desarrollo de documentos matemáticos mejora mucho con la ayuda de paquetes
provistos por la American Mathematical Society (AMS).

```latex
\usepackage{amsmath}
```

El paquete `amsmath` provee mejoras a los entornos nativos de LaTeX e incluye
los propios, entre otras herramientas útiles.

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

#### Fondo de página

```latex
\pagecolor{lightgray}
```

## Código de software
