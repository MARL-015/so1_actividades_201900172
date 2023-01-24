## Actividad 1 <img src="https://tenor.com/bVBnb.gif" alt="drawing" width="30"/>
- Melani Alejandra López de la Roca -- 201900172

# Tipos de Kernel y sus Diferencias 

En sistemas operativos existen diferentes ***tipos de kernel*** y dispositivos finales. Un Kernel es el núcleo central del sistema, encargado de gestionar los recursos del sistema y controlar todas las funciones importantes del hardware. Conforme a sus características pueden incluirse algunos de los más comunes:

* **Kernel monolítico**: Este Kernel es uno de los más comunes ya que es un kernel grande para todas las tareas. Es el único responsable de la gestión de la memoria y de los procesos, de la comunicación entre procesos y proporciona funciones de soporte de drivers y hardware. En este Kernel todo el código se ejecuta en el espacio de usuario con los mismos privilegios y generalmente los sistemas operativos que se usan son Linux, OS X y Windows.

* **Microkernel**: El microkernel se ha diseñado intencionadamente de un tamaño pequeño para que en caso de fallo no paralice todo el sistema operativo, es decir, solo contiene las funciones básicas necesarias para la gestión de recursos y comunicación. No obstante, para que pueda asumir las mismas funciones que un kernel grande, está dividido en varios módulos con ciertos privilegios. Son más seguros que 
los monolíticos.

* **Kernel híbrido**: Es una combinación del kernel monolítico y el microkernel. En este caso, el kernel grande se hace más compacto y modulable. Otras partes del kernel pueden cargarse dinámicamente. Esto ya ocurre en cierta medida en Linux y OS X.
Una característica especial con que cuenta el núcleo híbrido es que incluyen código extra con el objetivo de mejorar el rendimiento. La mayoría de los sistemas operativos modernos contienen un núcleo híbrido.

## Diferencias entre los tipos de Kernel

| Tipo de Kernel| Ventajas | Desventajas |
| :---         |     ---      |          --- |
| Monolítico   | Es fácil de desarrollar y mantener debido a la estructura simple del código. También provee un rendimiento rápido y eficiente debido a la integración de sus funciones en un solo espacio de memoria.|  Puede ser menos seguro debido a la integración de todas las funciones en un solo espacio de memoria, por lo que puede ser propenso a fallos debido a la complejidad del código.  |
||||
| Microkernel   | Es más seguro debido a la separación de las funciones en módulos con menos privilegios.Es más escalable debido a la separación de las funciones en módulos independientes.| Puede ser más difícil de desarrollar y mantener debido a la complejidad de la comunicación entre los módulos, y por lo mismo puede tener un rendimiento más lento.  |
||||
| Híbrido   | Puede ser más fácil de desarrollar y mantener que un microkernel, debido a la integración de algunas funciones en un solo espacio de memoria y combina las ventajas de los kernels monolíticos y microkernels.| Puede ser más complejo de desarrollar y mantener que un kernel monolítico, debido a la integración de algunas funciones en módulos separados y puede no ofrecer las mismas ventajas de seguridad y escalabilidad que los microkernel.  |

# User vs Kernel Mode
En un sistema operativo, el modo de usuario y el modo de kernel son dos modos diferentes en los que puede ejecutarse el código. Las aplicaciones suelen ejecutarse en modo usuario y los componentes principales del sistema operativo se ejecutan en modo kernel. Si bien muchos controladores se ejecutan en modo kernel, algunos controladores pueden ejecutarse en modo de usuario.

* ***Modo de usuario:***  En este modo, el código ejecutado tiene limitaciones en el acceso a los recursos del sistema y solo puede realizar operaciones permitidas para los usuarios. Los programas corriendo en el modo de usuario no tienen acceso directo a los recursos del sistema como la memoria, los dispositivos de entrada/salida, etc.
El proceso proporciona a la aplicación un espacio de direcciones virtuales privado y una tabla de identificadores privados. Dado que el espacio de direcciones virtuales de una aplicación es privado, una aplicación no puede modificar los datos que pertenecen a otra aplicación. Cada aplicación se ejecuta de forma aislada y, si una aplicación se bloquea, el bloqueo se limita a esa aplicación. Otras aplicaciones y el sistema operativo no se ven afectados por el bloqueo.

* ***Modo de kernel:***  En este, el código ejecutado tiene acceso completo a todos los recursos del sistema, incluyendo la memoria, los dispositivos de entrada/salida, etc. El kernel es el código que se ejecuta en este modo y es responsable de gestionar los recursos del sistema y proporcionar una interfaz para los programas.
Todo el código que se ejecuta en modo kernel comparte un único espacio de direcciones virtuales. Por lo tanto, un controlador en modo kernel no está aislado de otros controladores y del propio sistema operativo. No es posible ejecutar todos los procesos en el modo kernel porque si un proceso falla, todo el sistema operativo puede fallar.

La transición entre el modo de usuario y el modo de kernel se realiza mediante una interrupción o una llamada del sistema. Los programas en el modo de usuario pueden solicitar servicios del kernel mediante llamadas del sistema, que causan una interrupción y una transición temporal al modo de kernel para que el kernel pueda proporcionar el servicio solicitado. Después de proporcionar el servicio, el kernel regresa al modo de usuario. El que existan estos modos ayudan a proteger el sistema operativo y los recursos del sistema de errores y fallos en programas de usuario.

En este diagrama se muestra la comunicación entre los componentes de modo usuario y modo kernel.
![](https://learn.microsoft.com/es-es/windows-hardware/drivers/gettingstarted/images/userandkernelmode01.png) 


[**Referencia_Kernel**](https://www.ionos.es/digitalguide/servidores/know-how/que-es-el-kernel/)
[**Referencia_Modos**](https://learn.microsoft.com/es-es/windows-hardware/drivers/gettingstarted/user-mode-and-kernel-mode)