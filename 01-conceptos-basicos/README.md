# Conceptos básicos

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
A veces, un cierto estado que debe tener un alcance limitado.
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
Algunos comandos permiten parámetros opcionales, se agregan después del nombre
del comando entre corchetes `[]`.

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
