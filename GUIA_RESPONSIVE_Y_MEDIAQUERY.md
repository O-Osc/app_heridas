# 📱 Guía de Diseño Responsivo y Control de Desbordamientos (Overflow) en Flutter

Esta guía contiene los conceptos, patrones y buenas prácticas esenciales para evitar los errores de desbordamiento (`A RenderFlex overflowed by X pixels`) y crear widgets adaptables a cualquier tamaño de pantalla.

---

## 1. ¿Por qué ocurren los desbordamientos (Overflow)?

Los desbordamientos suceden cuando un widget contenedor flex (`Row` o `Column`) intenta renderizar a sus hijos con un tamaño fijo o no restringido que supera los límites visibles del dispositivo:

* **Desbordamiento Horizontal (Right Overflow):** Ocurre dentro de un `Row` cuando el ancho combinado de los elementos internos es mayor que el ancho de la pantalla.
* **Desbordamiento Vertical (Bottom Overflow):** Ocurre dentro de un `Column` cuando el alto de sus elementos supera la altura disponible o cuando se despliega el teclado digital.

---

## 2. El Rol de `MediaQuery`

`MediaQuery` permite consultar en tiempo real las dimensiones y características físicas de la pantalla del dispositivo.

### Métodos Principales

```dart
// Obtener el tamaño total de la pantalla
final size = MediaQuery.sizeOf(context); 
final double screenWidth = size.width;
final double screenHeight = size.height;

// Detectar orientación
final bool isLandscape = MediaQuery.orientationOf(context) == Orientation.landscape;

// Obtener insets del sistema (Teclado, Notch, barra de estado)
final EdgeInsets viewPadding = MediaQuery.paddingOf(context);
final double topNotch = viewPadding.top;

// Definir si la pantalla es pequeña (Breakpoint)
final bool isSmallScreen = screenWidth < 360;
```

> 💡 **Tip de Rendimiento:** Prefiere `MediaQuery.sizeOf(context)` sobre `MediaQuery.of(context).size` en Flutter moderno, ya que reduce re-renderizados innecesarios.

---

## 3. Estrategias y Widgets para Eliminar el Overflow

### 3.1. `Expanded` y `Flexible` (Para `Row` y `Column`)
Obligan a los hijos a adaptarse al espacio remanente en lugar de exigir su propio ancho/alto infinito.

```dart
Row(
  children: [
    const CircleAvatar(radius: 30),
    const SizedBox(width: 12),
    // 🔴 SIN Expanded: Si el texto es largo, causará Right Overflow.
    // 🟢 CON Expanded: Restringe el texto al espacio restante.
    Expanded(
      child: Text(
        "Nombre muy largo del paciente o descripción extendida",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  ],
)
```

### 3.2. Distribuir Tarjetas de Forma Equitativa
Para mostrar varios elementos en fila sin medir anchos fijos en píxeles (ej. `width: 100` ❌):

```dart
Row(
  children: [
    Expanded(child: _statCard(value: '8', label: 'Evoluciones')),
    const SizedBox(width: 8),
    Expanded(child: _statCard(value: '8', label: 'Días tto.')),
    const SizedBox(width: 8),
    Expanded(child: _statCard(value: '8', label: 'Próx. Cita')),
  ],
)
```

### 3.3. `FittedBox` (Ajuste de Texto y Contenido Dinámico)
Escala automáticamente su hijo para que encaje perfectamente dentro de las dimensiones de su contenedor sin cortarse.

```dart
FittedBox(
  fit: BoxFit.scaleDown, // Escala hacia abajo si el texto sobrepasa el ancho
  child: Text(
    "8888",
    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
  ),
)
```

### 3.4. `SingleChildScrollView` (Prevenir Bottom Overflow)
Evita el desbordamiento vertical cuando hay muchos elementos o cuando aparece el teclado digital.

```dart
Scaffold(
  body: SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      children: [
        // Tus widgets aquí...
      ],
    ),
  ),
)
```

---

## 4. Cálculo Responsivo Proporcional con `.clamp()`

Para evitar que los márgenes o elementos se vean gigantes en tablets o minúsculos en teléfonos pequeños, se utilizan proporciones limitadas (`clamp`):

```dart
@override
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.sizeOf(context).width;

  // El padding será el 5% del ancho de la pantalla, pero NUNCA menor a 16px ni mayor a 24px
  final horizontalPadding = (screenWidth * 0.05).clamp(16.0, 24.0);

  // El avatar escala según la pantalla pero se mantiene entre 32 y 45 px de radio
  final avatarRadius = (screenWidth * 0.10).clamp(32.0, 45.0);

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
    child: CircleAvatar(radius: avatarRadius),
  );
}
```

---

## 5. Cheatsheet / Lista de Verificación para Nuevos Widgets

Al crear cualquier widget nuevo, realiza este chequeo:

| Escenario | Solución Recomendada |
| :--- | :--- |
| Texto dentro de un `Row` | Envolver en `Expanded` + Usar `overflow: TextOverflow.ellipsis` |
| 3 o más tarjetas/botones en una fila | Usar `Row` con cada tarjeta envuelta en `Expanded` |
| Textos grandes dentro de cajas pequeñas | Usar `FittedBox(fit: BoxFit.scaleDown)` |
| Pantallas con formulario o listas | Usar `SingleChildScrollView` o `ListView` |
| Tamaños ajustables por pantalla | Usar `MediaQuery.sizeOf(context).width` con `.clamp(min, max)` |
| Consultar restricciones del contenedor | Usar `LayoutBuilder` |

---

## 6. Resumen de la Implementación en `profile_patient.dart`

En la pantalla de **Perfil del Paciente** realizada:
1. Se calculó `screenWidth` y `isSmallScreen` usando `MediaQuery`.
2. Se reemplazó el `Column` rígido por un `SingleChildScrollView`.
3. Se envolvió el bloque de texto del paciente en un `Expanded` para evitar el desbordamiento horizontal.
4. Se cambió el ancho fijo (`width: 100`) de los cuadros informativos por `Expanded` para que se adapten automáticamente a cualquier ancho de celular.
5. Se agregó `FittedBox` en los textos de los cuadros informativos para prevenir recortes cuando el texto es largo o la pantalla es angosta.
