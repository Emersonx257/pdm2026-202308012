# Diagrama de flujo — Feature: "¿Viene mi bus?"

> **Estudiante:** Emerson Tahay — 202308012  
> **Feature:** Consulta de tiempo estimado de llegada del próximo bus a tu parada  
> **Dolor que ataca:** Marco no sabe si el bus ya pasó o viene en camino (F2 del mapa de recorrido)  
> **Cita ancla:** "No hay app que te diga dónde va el bus. Uno se aprende los horarios a puro golpe."

---

## Descripción de la feature

El usuario abre la app, selecciona su parada y ruta, y ve el tiempo estimado de llegada del próximo bus. La estimación se alimenta de **reportes comunitarios**: otros usuarios reportan cuando ven o abordan un bus, y el sistema calcula la posición aproximada. Si no hay reportes recientes, la app muestra el horario base con una advertencia de baja confianza.

---

## Diagrama de flujo

```mermaid
flowchart TD
    A([Usuario abre la app]) --> B{¿Tiene ubicación activada?}
    
    B -->|Sí| C[Detectar parada más cercana automáticamente]
    B -->|No| D[Mostrar lista de paradas para seleccionar manualmente]
    
    C --> E[Mostrar parada detectada]
    D --> E
    
    E --> F[Usuario selecciona la ruta / número de bus]
    
    F --> G{¿Hay reportes comunitarios recientes de esa ruta?\n¿Últimos 30 min?}
    
    G -->|Sí| H[Calcular tiempo estimado de llegada\nbasado en último reporte + distancia]
    G -->|No| I[Mostrar horario base programado\ncon advertencia: ⚠️ Sin reportes recientes]
    
    H --> J[Mostrar pantalla de resultado:\n🚌 Bus Ruta 17\n⏱️ ~8 min\n📍 Visto en km 4 hace 6 min\n👥 Reportado por 3 usuarios]
    
    I --> K[Mostrar pantalla de resultado:\n🚌 Bus Ruta 17\n⏱️ ~15 min según horario\n⚠️ Estimación sin confirmar]
    
    J --> L{¿Usuario quiere hacer algo más?}
    K --> L
    
    L -->|Ver otra ruta| F
    L -->|Activar alerta| M[Configurar notificación:\nAvisar cuando el bus esté a 5 min]
    L -->|Reportar bus| N[Usuario ve el bus llegando\ny toca Reportar]
    L -->|Salir| O([Fin])
    
    M --> P[Esperar...\nMonitorear reportes entrantes]
    P --> Q{¿Bus reportado cerca?}
    Q -->|Sí| R[🔔 Notificación:\nTu bus viene en ~3 min]
    Q -->|No, pasó el tiempo estimado| S[🔔 Notificación:\nEl bus podría estar atrasado.\n¿Buscar alternativa?]
    
    R --> O
    S --> T{¿Buscar alternativa?}
    T -->|Sí| F
    T -->|No| O
    
    N --> U[Registrar reporte:\nRuta + Parada + Hora + Nivel de ocupación]
    U --> V[Actualizar estimaciones\npara otros usuarios en la ruta]
    V --> O
```

---

## Flujo resumido en pasos

| Paso | Acción del usuario | Respuesta del sistema |
|---|---|---|
| 1 | Abre la app | Detecta ubicación o muestra lista de paradas |
| 2 | Selecciona parada y ruta | Busca reportes comunitarios recientes |
| 3 | — | Si hay reportes: muestra ETA con confianza alta. Si no: muestra horario base con advertencia |
| 4 | (Opcional) Activa alerta | Le avisa cuando el bus esté a ~5 min según reportes |
| 5 | (Opcional) Reporta bus | Alimenta el sistema para otros usuarios |
| 6 | (Si hay atraso) Busca alternativa | Muestra otras rutas disponibles |

---

## Conexión con el problema definido

| Elemento del S03 | Cómo lo resuelve esta feature |
|---|---|
| **Job:** "Quiero tener certeza de que voy a llegar sin contratiempos" | Le da información para tomar decisiones antes de quedarse varado |
| **Valle F4 (Imprevisto):** Bus no llega o se descompone | La alerta de atraso le permite buscar alternativa antes de perder tiempo |
| **Valle F2 (Parada):** Espera sin info | Reemplaza "un poste con un letrero" por un estimado de llegada |
| **Dolor:** "Uno se aprende los horarios a puro golpe" | Los reportes comunitarios dan info real, no solo horarios teóricos |
