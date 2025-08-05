[README.md](https://github.com/user-attachments/files/21608108/README.md)
# Salesforce Flow: Detección de Contratos Duplicados

Este proyecto muestra cómo detectar contratos duplicados en Salesforce utilizando un Screen Flow y una clase Apex invocable (`FindDuplicateContracts`).

## 🔍 ¿Qué hace este flujo?

Cuando un usuario ejecuta el flujo desde un Contrato, el sistema:

1. Recupera el contrato actual.
2. Llama a una clase Apex que busca otros contratos con el mismo tipo y cuenta, excluyendo el contrato actual.
3. Si se encuentran duplicados, se muestran en pantalla.
4. Si no hay duplicados, se muestra un mensaje amigable.

## ⚙️ Elementos principales

- **Apex:**
  - `FindDuplicateContracts.cls`
  - `ContractInput.cls`
  - `ContractResult.cls`

- **Flow Builder:**
  - Variable `recordId` (entrada)
  - Get Records: `Get_Contract`
  - Apex Action: `Find_Duplicate_Contracts`
  - Loop + Assignment para contar duplicados
  - Decision `Duplicated Contracts?`
  - Pantalla para mostrar duplicados o mensaje sin duplicados

## 🛑 Manejo de errores

En este proyecto se optó por **no implementar una ruta Fault personalizada** en el Flow.  
Esto permite enfocarse en el funcionamiento central del flujo sin sobrecargar la interfaz con detalles técnicos.

## 📸 Capturas de pantalla

Ver captures

## 👨‍💻 Autor

Marcelo Gaete  
Salesforce Consultant | Flow & Automation | Apex & LWC
