# Conceptos básicos

## Indice
* [Lenguaje LaTeX](#lenguaje-latex)
  + [Caracteres reservados](#caracteres-reservados)
  + [Grupos](#grupos)
  + [Comandos](#comandos)
  + [Entornos](#entornos)
  + [Comentarios](#comentarios)
* [Estructura general](#estructura-general)
  + [Preambulo](#preambulo)
    - [Clase del documento](#clase-del-documento)
    - [Paquetes](#paquetes)
  + [Documento](#documento)
    - [Comandos de secciones](#comandos-de-secciones)
    - [Formato de texto](#formato-de-texto)
    - [Formato de párrafo](#formato-de-párrafo)
* [Ejercicio](#ejercicio)

## Lenguaje LaTeX
Los archivos LaTeX se escriben en texto plano, pudiendo usar cualquier editor
de texto.
El archivo LaTeX contiene el contenido del documento y comandos que indican cómo
componer el texto.
Los archivos LaTeX se suelen guardar con la extensión `.tex`.

Un ejemplo mínimo es el siguiente:

```latex
\documentclass{article}

\begin{document}
¡Hola mundo!
\end{document}
```

### Caracteres reservados
Los siguientes caracteres están reservados para el lenguaje LaTeX.
En caso de introducirlos directamente, no se mostrará en el documento.

```
# $ % ^ & _ { } ~ \
```

Para poder usar estos caracteres en el documento, se debe agregar una barra
invertida como prefijo.

```latex
\# \$ \% \^{} \& \_ \{ \} \~{} \textbackslash{}
```

Los comandos `\~` y `\^` producen, respectivamente, una tilde y un sombrero que
se coloca sobre la letra siguiente.
Por eso necesita de llaves para indicar que no tiene letra como argumento.
El caracter de barra invertida `\` no se puede introducir con el agregado de
otra barra invertida como prefijo (`\\`) ya que esta secuencia se utiliza para
los saltos de línea.
En el modo matemático, se puede usar `\` sin necesidad de prefijo alguno.

### Grupos
A veces, un cierto estado debe tener un alcance limitado.
Se puede hacer encerrando entre llaves la parte que debe tener el estado dado.
En algunos casos, el uso de llaves no será posible.
LaTeX proporciona `\bgroup` y `\egroup` para comenzar y finalizar un grupo,
respectivamente.

```latex
texto normal {\itshape texto en itálica \bfseries texto en negrita e itálica} más texto normal

texto normal \bgroup\itshape texto en itálica \bfseries texto en negrita e itálica\egroup{} más texto normal
```

### Comandos
Los comandos son _case sensitive_ (distinguen entre mayúsculas y minúsculas),
y puede tener uno de los siguientes formatos.

* Comienzan con una barra invertida `\` y sigue con un nombre compuesto sólo de
  letras. Los nombres de los comandos se terminan con un espacio, un número o
  cualquier otra "no letra".
* Se componen de una barra invertida `\` y exactamente una "no letra".

Algunos comandos necesitan argumentos, que se ingresan entre llaves `{}`
después del nombre del comando.
Los comandos pueden permitir parámetros opcionales, se agregan después del
nombre del comando entre corchetes `[]`.

```latex
\nombrecomando[opcion1,opcion2,...]{argumento1}{argumento2}
```

La mayoría de los comandos estándar de LaTeX tienen un interruptor (_switch_)
equivalente.
Interruptores no tienen argumentos sino que se aplican en el resto del ámbito
del alcance, es decir, el grupo o entorno actual.

```latex
% \emph es un comando con un argumento, \em es un interruptor.
\emph{texto con énfasis}, texto normal
{\em texto con énfasis}, texto normal
```

### Entornos
Los entornos (del inglés _environments_) tienen una funcion similar a los
comandos, pero por lo general tienen efecto en una parte más amplia del
documento.

```latex
\begin{nombreentorno}
texto en el que influye el entorno
\end{nombreentorno}
```

Entre el `\begin` y el `\end` se puede anidar otros otros comandos y entornos.
Los entornos pueden aceptar argumentos, pero no es común.

### Comentarios
El caracter `%` es un caracter especial que indica a LaTeX que ignore el
contenido del resto de la línea actual, el salto de línea y los espacios al
principio de la línea siguiente.

Esto es útil para escribir comentarios y notas en el archivo LaTeX, que no se
desean mostrar en el documento final.

## Estructura general
La estructura general de un archivo LaTeX es la siguiente:

```latex
\documentclass{...}

% preambulo

\begin{document}

% contenido del documento

\end{document}
```

El área entre `\documentclass{...}` y `\begin{document}` es el preámbulo.
Contiene los comandos que afectan a todo el documento.
El área entre `\begin{document}` y `\end{document}` contiene el texto del
documento.

### Preambulo

#### Clase del documento
LaTeX necesita saber el tipo de documento que se va a crear.
Esto se especifica con el comando

```latex
\documentclass[options]{class}
```

La clase (_class_) especifica el tipo de documento que va a ser creado.
Las opciones personaliza el comportamiento de la clase de documento.

Ejemplo:

```latex
\documentclass[11pt,twoside,a4paper]{article}
```
Indica que el documento sea interpretado como un artículo con un tamaño de
fuente de 11 puntos de base, con un diseño adecuado para la impresión a doble
faz y en papel A4.

##### Clases más comunes
* **article** - Para artículos en revistas científicas, informes breves,
  documentación de los programas, etc.
* **report** - Similar a _article_ pero para documentos más largos.
* **book** - Para libros reales.

##### Opciones más comunes
* **10pt, 11pt, 12pt** - Tamaño base para la fuente. Por defecto es 10pt.
* **a4paper, letterpaper, ...** - Tamaño del papel. El tamaño por defecto es
  _letterpaper_.
* **twoside, oneside** - Especifica si el documento es de simple faz o doble faz.
  El valor por defecto para las clases _article_ y _report_ es _oneside_ y para
  _book_ es _twoside_.

#### Paquetes
Extienden la funcionalidad de LaTex.
Las distribuciones LaTeX incluyen una gran cantidad de paquetes preinstalados.
Los paquetes se incluyen con el siguiente comando

```latex
\usepackage[opcion1,opcion2,opcion3]{paquete}
```

Los paquetes pueden permitir opciones para realizar ajustes o habilitar
características especiales.

### Documento

#### Comandos de secciones
Ejemplo de secciones:

```latex
\chapter{Introducción}
Contenido del capítulo...

\section{Estructura}
Contenido de la sección...

\subsection{Primer cuestion}
Contenido de la subsección...

\subsubsection{Información}
Contenido de la subsubsección...
```

Además, no es necesario crear entornos con los comandos `\begin` y `\end` para
indicar que el contenido pertenece a un bloque.

LaTeX provee 7 niveles de profundidad para secciones.

| Comando                         | Nivel | Comentario                |
| ------------------------------- | ----- | ------------------------- |
| `\part{Parte}`                  | -1    |                           |
| `\chapter{Capítulo}`            | 0     | Sólo en _book_ y _report_ |
| `\section{Sección}`             | 1     |                           |
| `\subsection{Subsección}`       | 2     |                           |
| `\subsubsection{Subsubsección}` | 3     |                           |
| `\paragraph{Párrafo}`           | 4     |                           |
| `\subparagraph{Subpárrafo}`     | 5     |                           |

También se cuenta con comando `\appendix` para indicar que las secciones que se
encuentren posteriormente se enumeren como apéndice

##### Numeración de las secciones
La numeración de las secciones se realiza automáticamente por LaTeX, no es
necesario agregarla de forma explícita, sólo hay que introducir el título
entre las llaves.
Las partes se numeran con números romanos (Parte I, Parte II, etc.); capítulos y
secciones con números decimales y los apéndices con letras (A, B, C, etc.)

Si se desea incluir una sección sin numeración, se debe agregar el sufijo `*` al
comando de la sección, antes de los asteriscos.

```latex
\subsection*{Introducción}
```

#### Formato de texto

##### Familia
La familia es una colección de fuentes.
Latex organiza las fuentes en tres familias.

| Nombre     | Comando LaTeX  | Equivalente a     | Comentarios          |
| ---------- | -------------- | ----------------- | -------------------- |
| Roman      | `\textrm{...}` | `{\rmfamily ...}` | Fuente Serif         |
| Sans Serif | `\textsf{...}` | `{\sffamily ...}` | Fuente Sans Serif    |
| Teletype   | `\texttt{...}` | `{\ttfamily ...}` | Fuente monoespaciada |

##### Serie
La serie de una fuente determina que tan gruesa o expandida será.

| Nombre | Comando LaTeX  | Equivalente a     | Comentarios            |
| ------ | -------------- | ----------------- | ---------------------- |
| Bold   | `\textbf{...}` | `{\bfseries ...}` |                        |
| Medium | `\textmd{...}` | `{\mdseries ...}` | Entre normal y bold    |
| Light  | `\textlf{...}` | `{\lfseries ...}` | Más fina que la normal |

##### Forma
La forma que puede tener un caracter dentro de una familia.

| Nombre         | Comando LaTeX  | Equivalente a    | Comentarios              |
| -------------- | -------------- | ---------------- | ------------------------ |
| Upright        | `\textup{...}` | `{\upshape ...}` | Igual a la fuente normal |
| Italic         | `\textit{...}` | `{\itshape ...}` |                          |
| Slanted        | `\textsl{...}` | `{\slshape ...}` |                          |
| Small Capitals | `\textsc{...}` | `{\scshape ...}` |                          |

##### Otros comandos de estilos

| Nombre    | Comando LaTeX      | Equivalente a       | Comentarios                  |
| --------- | ------------------ | ------------------- | ---------------------------- |
| Normal    | `\textnormal{...}` | `{\normalfont ...}` | Fuente normal                |
| Emphasis  | `\emph{...}`       | `{\em ...}`         | Generalmente itálica         |
| Uppercase | `\uppercase{...}`  |                     | Todo el texto en mayúsculas  |
| Lowercase | `\lowercase{...}`  |                     |  Todo el texto en mayúsculas |
| Underline | `\underline{...}`  |                     | Subrayado                    |

##### Tamaños

| Comando               |
| --------------------- |
| `{\tiny ...}`         |
| `{\scriptsize ...}`   |
| `{\footnotesize ...}` |
| `{\small ...}`        |
| `{\normalsize ...}`   |
| `{\large ...}`        |
| `{\Large ...}`        |
| `{\LARGE ...}`        |
| `{\huge ...}`         |
| `{\Huge ...}`         |

##### Marcas de citas
```latex
`cita simple' en LaTeX
``cita doble'' en LaTeX
,,cita alemán'' en LaTeX
<<cita francés>> en LaTeX
```

##### Superscript y subscript
Se encuentran disponible los comandos `\textsubscript{}` y `\textsuperscript{}`.

```latex
1\textsuperscript{er} oración
2\textsuperscript{da} oración
...
```

##### Guiones
LaTeX conoce cuatro tipos de guiones: guión (-), guión corto (–), guión largo
(—) y signo menos (−)

| Nombre             | Entrada | Salida | Propósito                         |
| ------------------ | ------- | ------ | --------------------------------- |
| Guión              | -       | -      | Entre palabras, ej. ex-presidente |
| Guión corto        | --      | –      | Rango de páginas, ej. 1–12        |
| Guión largo o raya | ---     | —      | Guión de puntuación               |
| Signo menos        | $-$     | −      | Signo menos matemático            |

##### Elipsis
Es una secuencia de tres puntos que se suele utilizar para indicar texto omitido.
El espaciado es diferente al de la inserción de tres puntos.
LaTeX provee el comando especial `\ldots` para elipsis.

#### Formato de párrafo

##### Alineación
La alineación por defecto de los párrafos en latex es el justificado.
Para otros tipos de alineación se disponen de entornos y comandos.

| Alineación | Entorno LaTeX | Comando              |
| ---------- | ------------- | -------------------- |
| Izquierda  | `flushleft`   | `{\raggedright ...}` |
| Derecha    | `flushright`  | `{\raggedleft ...}`  |
| Centrada   | `center`      | `{\centering ...}`   |

Ejemplo
```latex
\begin{flushright}
  texto alineado hacia la derecha
\end{flushright}
```

##### Estructuras de lista
Las listas son entornos que pueden ser de tres tipos:
* `itemize` para listas con bullets
* `enumerate` para listas numeradas
* `description` para listas descriptivas

Formato básico:

```latex
\begin{tipo_de_lista}
  \item Primer item
  \item Segundo item
  \item Tercer item
  \item \ldots
\end{tipo_de_lista}
```

Las listas se pueden anidar simplemente agregando nuevos entornos:

```latex
\begin{tipo_de_lista}
  \item Primer item
  \item Segundo item
  \begin{tipo_de_lista_anidada}
    \item Primer item anidado
    \item Segundo item anidado
  \end{tipo_de_lista_anidada}
  \item Tercer item
  \item \ldots
\end{tipo_de_lista}
```

##### Notas al pie
En LaTeX se pueden agregar notas al pie con el comando

```latex
\footnote{Texto de la nota al pie}
```

Ejemplo:
```latex
... y, de hecho, el mal entendimiento respecto del carácter puramente existencial
del axioma de elección ha llevado a muchas discusiones estériles durante algunas
décadas\footnote{cf. F. P. Ramsey. \textit{The foundations of Mathematics},
London Mathematical Society.}
```

La nota al pie puede recibir una opción donde se indica cuál va a ser la marca.

```latex
\footnote[3]{Texto de la nota al pie}
```

Por defecto las notas al pie se numeran con numeración arábica.
Esto se puede personalizar.

```latex
\renewcommand{\thefootnote}{\arabic{footnote}}   % Numeración arábiga: 1, 2, 3...
\renewcommand{\thefootnote}{\roman{footnote}}    % Numeración romana en minúsculas: i, ii, iii...
\renewcommand{\thefootnote}{\Roman{footnote}}    % Numeración romana en mayúsculas: I, II, III...
\renewcommand{\thefootnote}{\alph{footnote}}     % Numeración alfabética en minúsculas a, b, c...
\renewcommand{\thefootnote}{\Alph{footnote}}     % Numeración alfabética en mayúsculas: A, B, C...
\renewcommand{\thefootnote}{\fnsymbol{footnote}} % No números, sino símbolos diversos
```

##### Partición de palabras
Cuando el texto llega al final de línea de la página, LaTeX partirá las palabras.
Por defecto, LaTeX tendrá en cuenta la partición de palabras para el idioma inglés.
Para otros idiomas se debe cargar el paquete `babel` e indicar el idioma que va
a utilizar el documento.

```latex
\usepackage[spanish]{babel}
```

Aún asi, puede ocurrir que algunas palabas no las particione correctamente.
Para ello, en el preambulo se agrega el comando `\hyphenation` con la forma
correcta en que se particionan.

```latex
\hyphenation{ne-o-or-to-do-xia bi-o-a-e-ro-sol}
```

En el ejemplo se provee la partición correcta para las palabras "neoortodoxia" y
"bioaerosol".

Ahora puede ocurrir que no deseamos que una palabra sea partida por LaTeX, para
eso se utiliza `mbox{}`.

```latex
\mbox{bioaerosol}
```

## Ejercicio
Buscar una receta de cocina (por ejemplo, locro patrio) y transcribirlo en un
documento LaTeX que cumpla las siguientes condiciones:
* utilizar por lo menos 2 tipos de secciones diferentes.
* utilizar listas, por lo menos una de bullets y otra numerada.
* dar formato al texto (negrita, cursiva, etc.) donde se considere conveniente.
* indicar la fuente (sitio web) en la que se obtuvo la receta, en una nota al pie.
