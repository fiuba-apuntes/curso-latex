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
    - [Formato de párrafo](#formato-de-parrafo)

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
Hello world!
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
##### Marcas de citas
```latex
`cita simple' en LaTeX
``cita doble'' en LaTeX
,,cita alemán'' en LaTeX
<<cita francés>> en Latex
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

| Nombre             | Entrada | Salida | Propósito                  |
| ------------------ | ------- | ------ | -------------------------- |
| Guión              | -       | -      | Entre palabras             |
| Guión corto        | --      | –      | Rango de páginas, ej. 1–12 |
| Guión largo o raya | ---     | —      | Guión de puntuación        |
| Signo menos        | $-$     | −      | Signo menos matemático     |

##### Elipsis
Es una secuencia de tres puntos que se suele utilizar para indicar texto omitido.
El espaciado es diferenta al de la inserción de tres puntos.
LaTeX provee el comando especial `\ldots` para estos puntos.

#### Formato de párrafo