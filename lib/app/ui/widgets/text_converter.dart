import 'package:flutter/material.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';

class TextConverter extends StatelessWidget {

  @override
  final Listas listas = Listas();
  Widget build(BuildContext context) {
    return Container();
  }

  String iconToCategory(String string) {
    for (int i=0;i<listas.listIcons().length;i++) {
      for (int y=0;y<listas.listCategories().length;y++) {
        if (string == listas.listIcons()[i]) {
        return listas.listCategories()[i];
        }
      }
    }
    return 'La categoria NO existe!';
  }

  String categoryToIcon(String string) {
    for (int y=0;y<listas.listCategories().length;y++) {
      for (int i=0;i<listas.listIcons().length;i++) {
        if (string == listas.listCategories()[y]) {
        return listas.listIcons()[y];
        }
      }
    }
    return 'La categoria NO existe!';
  }
  
  String infoCategory(String icon){
    if (icon == listas.listIcons()[0]) {
      return 'Erradicar la pobreza en todas sus formas sigue siendo uno de los principales desafíos que enfrenta la humanidad. Si bien la cantidad de personas que viven en la extrema pobreza disminuyó en más de la mitad entre 1990 y 2015, aún demasiadas luchan por satisfacer las necesidades más básicas.\n\nA nivel mundial, alrededor de 736 millones de personas aún viven con menos de US\$ 1,90 al día (2015) y muchos carecen de acceso a alimentos, agua potable y saneamiento adecuados.\n\nEl crecimiento económico acelerado de países como China e India ha sacado a millones de personas de la pobreza, pero el progreso ha sido disparejo. La posibilidad de que las mujeres vivan en situación de pobreza es desproporcionadamente alta en relación con los hombres, debido al acceso desigual al trabajo remunerado, la educación y la propiedad.';
    } if (icon == listas.listIcons()[1]) {
      return 'Debido al rápido crecimiento económico y al aumento de la productividad agrícola en las últimas dos décadas, el número de personas desnutridas disminuyó casi a la mitad. Muchos países en desarrollo que sufrían hambrunas están ahora en condiciones de satisfacer las necesidades nutricionales de los más vulnerables. Regiones como Asia Central y Oriental y América Latina y el Caribe han avanzado enormemente en la erradicación del hambre.\n\nLos Objetivos de Desarrollo Sostenible buscan terminar con todas las formas de hambre y desnutrición para 2030 y velar por el acceso de todas las personas, en especial los niños, a una alimentación suficiente y nutritiva durante todo el año.\n\nEsta tarea implica promover prácticas agrícolas sostenibles a través del apoyo a los pequeños agricultores y el acceso igualitario a la tierra, la tecnología y los mercados. Además, se requiere el fomento de la cooperación internacional para asegurar la inversión en la infraestructura y la tecnología necesaria para mejorar la productividad agrícola.';
    } if (icon == listas.listIcons()[2]) {
      return 'Hemos logrado grandes avances en la lucha contra varias de las principales causas de muerte y enfermedad. La esperanza de vida ha aumentado drásticamente, las tasas de mortalidad infantil y materna han disminuido, hemos cambiado el curso del VIH y la mortalidad debida a la malaria se ha reducido a la mitad.\n\nLa buena salud es esencial para el desarrollo sostenible, y la Agenda 2030 refleja la complejidad y la interconexión de ambos. Toma en cuenta la ampliación de las desigualdades económicas y sociales, la rápida urbanización, las amenazas para el clima y el medio ambiente, la lucha continua contra el VIH y otras enfermedades infecciosas, y los nuevos problemas de salud, como las enfermedades no transmisibles.\n\nLa cobertura universal de salud será integral para lograr el ODS 3, terminar con la pobreza y reducir las desigualdades. Las prioridades de salud global emergentes que no se incluyen explícitamente en los ODS, incluida la resistencia a los antimicrobianos, también demandan acción.';
    } if (icon == listas.listIcons()[3]) {
      return 'Desde 2000 se ha registrado un enorme progreso en la meta relativa a la educación primaria universal. La tasa total de matrícula alcanzó el 91% en las regiones en desarrollo en 2015 y la cantidad de niños que no asisten a la escuela disminuyó casi a la mitad a nivel mundial. También ha habido aumentos significativos en las tasas de alfabetización y más niñas que nunca antes asisten hoy a la escuela. Sin duda, se trata de logros notables.\n\nEl objetivo de lograr una educación inclusiva y de calidad para todos se basa en la firme convicción de que la educación es uno de los motores más poderosos y probados para garantizar el desarrollo sostenible. Con este fin, el objetivo busca asegurar que todas las niñas y niños completen su educación primaria y secundaria gratuita para 2030. También aspira a proporcionar acceso igualitario a formación técnica asequible y eliminar las disparidades de género e ingresos, además de lograr el acceso universal a educación superior de calidad.';
    } if (icon == listas.listIcons()[4]) {
      return 'Poner fin a todas las formas de discriminación contra las mujeres y niñas no es solo un derecho humano básico, sino que además es crucial para el desarrollo sostenible. Se ha demostrado una y otra vez que empoderar a las mujeres y niñas tiene un efecto multiplicador y ayuda a promover el crecimiento económico y el desarrollo a nivel mundial.\n\nEl PNUD le ha otorgado a la igualdad de género un lugar central en su trabajo y hemos visto un progreso notable en los últimos 20 años. Más niñas van a la escuela que hace 15 años, y la mayoría de las regiones ha alcanzado la paridad de género en la educación primaria.\n\nGarantizar el acceso universal a salud reproductiva y sexual y otorgar a la mujer derechos igualitarios en el acceso a recursos económicos, como tierras y propiedades, son metas fundamentales para conseguir este objetivo. Hoy más mujeres que nunca ocupan cargos públicos, pero alentar a más mujeres para que se conviertan en líderes ayudará a alcanzar una mayor igualdad de género.';
    } if (icon == listas.listIcons()[5]) {
      return 'La escasez de agua afecta a más del 40 por ciento de la población mundial, una cifra alarmante que probablemente crecerá con el aumento de las temperaturas globales producto del cambio climático. Aunque 2.100 millones de personas han conseguido acceso a mejores condiciones de agua y saneamiento desde 1990, la decreciente disponibilidad de agua potable de calidad es un problema importante que aqueja a todos los continentes.\n\nCada vez más países están experimentando estrés hídrico, y el aumento de las sequías y la desertificación ya está empeorando estas tendencias. Se estima que al menos una de cada cuatro personas se verá afectada por escasez recurrente de agua para 2050.\n\nCon el fin de garantizar el acceso universal al agua potable segura y asequible para todos en 2030, es necesario realizar inversiones adecuadas en infraestructura, proporcionar instalaciones sanitarias y fomentar prácticas de higiene.\n\nAsegurar el agua potable segura y asequible universal implica llegar a más de 800 millones de personas que carecen de servicios básicos y mejorar la accesibilidad y seguridad de los servicios por más de dos mil millones.';
    } if (icon == listas.listIcons()[6]) {
      return 'Entre 2000 y 2016, la cantidad de personas con acceso a energía eléctrica aumentó de 78 a 87 por ciento, y el número de personas sin enegía bajó a poco menos de mil millones.\n\nSin embargo, a la par con el crecimiento de la población mundial, también lo hará la demanda de energía accesible, y una economía global dependiente de los combustibles fósiles está generando cambios drásticos en nuestro clima.\n\nPara alcanzar el ODS7 para 2030, es necesario invertir en fuentes de energía limpia, como la solar, eólica y termal y mejorar la productividad energética.\n\nExpandir la infraestructura y mejorar la tecnología para contar con energía limpia en todos los países en desarrollo, es un objetivo crucial que puede estimular el crecimiento y a la vez ayudar al medio ambiente.';
    } if (icon == listas.listIcons()[7]) {
      return 'Durante los últimos 25 años, la cantidad de trabajadores que viven en condiciones de pobreza extrema ha disminuido drásticamente, pese al impacto de la crisis económica de 2008 y las recesiones globales. En los países en desarrollo, la clase media representa hoy más del 34% del empleo total, una cifra que casi se triplicó entre 1991 y 2015.\n\nLos Objetivos de Desarrollo Sostenible apuntan a estimular el crecimiento económico sostenible mediante el aumento de los niveles de productividad y la innovación tecnológica. Fomentar políticas que estimulen el espíritu empresarial y la creación de empleo es crucial para este fin, así como también las medidas eficaces para erradicar el trabajo forzoso, la esclavitud y el tráfico humano. Con estas metas en consideración, el objetivo es lograr empleo pleno y productivo y un trabajo decente para todos los hombres y mujeres para 2030.';
    } if (icon == listas.listIcons()[8]) {
      return 'La inversión en infraestructura y la innovación son motores fundamentales del crecimiento y el desarrollo económico. Con más de la mitad de la población mundial viviendo en ciudades, el transporte masivo y la energía renovable son cada vez más importantes, así como también el crecimiento de nuevas industrias y de las tecnologías de la información y las comunicaciones.\n\nLos avances tecnológicos también con esenciales para encontrar soluciones permanentes a los desafíos económicos y ambientales, al igual que la oferta de nuevos empleos y la promoción de la eficiencia energética. Otras formas importantes para facilitar el desarrollo sostenible son la promoción de industrias sostenibles y la inversión en investigación e innovación científicas.\n\nMás de 4.000 millones de personas aún no tienen acceso a Internet y el 90 por ciento proviene del mundo en desarrollo. Reducir esta brecha digital es crucial para garantizar el acceso igualitario a la información y el conocimiento, y promover la innovación y el emprendimiento.';
    } if (icon == listas.listIcons()[9]) {
      return 'La desigualdad de ingresos está en aumento - el 10 por ciento más rico de la población se queda hasta con el 40 por ciento del ingreso mundial total, mientras que el 10 por ciento más pobre obtiene solo entre el 2 y el 7 por ciento del ingreso total. En los países en desarrollo, la desigualdad ha aumentado un 11 por ciento, si se considera el aumento de la población.\n\nPara frenar este aumento de las disparidades, es necesario adoptar políticas sólidas que empoderen a las personas de bajos ingresos y promuevan la inclusión económica de todos y todas, independientemente de su género, raza o etnia.';
    } if (icon == listas.listIcons()[10]) {
      return 'Más de la mitad de la población mundial vive hoy en zonas urbanas. En 2050, esa cifra habrá aumentado a 6.500 millones de personas, dos tercios de la humanidad. No es posible lograr un desarrollo sostenible sin transformar radicalmente la forma en que construimos y administramos los espacios urbanos.\n\nMejorar la seguridad y la sostenibilidad de las ciudades implica garantizar el acceso a viviendas seguras y asequibles y el mejoramiento de los asentamientos marginales. También incluye realizar inversiones en transporte público, crear áreas públicas verdes y mejorar la planificación y gestión urbana de manera que sea participativa e inclusiva.';
    } if (icon == listas.listIcons()[11]) {
      return 'Para lograr crecimiento económico y desarrollo sostenible, es urgente reducir la huella ecológica mediante un cambio en los métodos de producción y consumo de bienes y recursos. La agricultura es el principal consumidor de agua en el mundo y el riego representa hoy casi el 70% de toda el agua dulce disponible para el consumo humano.\n\nLa gestión eficiente de los recursos naturales compartidos y la forma en que se eliminan los desechos tóxicos y los contaminantes son vitales para lograr este objetivo. También es importante instar a las industrias, los negocios y los consumidores a reciclar y reducir los desechos, como asimismo apoyar a los países en desarrollo a avanzar hacia patrones sostenibles de consumo para 2030.';
    } if (icon == listas.listIcons()[12]) {
      return 'No hay país en el mundo que no haya experimentado los dramáticos efectos del cambio climático. Las emisiones de gases de efecto invernadero continúan aumentando y hoy son un 50% superior al nivel de 1990. Además, el calentamiento global está provocando cambios permanentes en el sistema climático, cuyas consecuencias pueden ser irreversibles si no se toman medidas urgentes ahora.\n\nApoyar a las regiones más vulnerables contriubuirá directamente no solo al Objetivo 13 sino tamién a otros Objetivos de Desarrollo Sostenible. Estas acciones deben ir de la mano con los esfuerzos destinados a integrar las medidas de reducción del riesgo de desastres en las políticas y estrategias nacionales.\n\nCon voluntad política y un amplio abanico de medidas tecnológicas, aún es posible limitar el aumento de la temperatura media global a dos grados Celsius por encima de los niveles pre-industriales, apuntando a 1,5°C. Para lograrlo, se requieren acciones colectivas urgentes.';
    } if (icon == listas.listIcons()[13]) {
      return 'Los océanos del mundo, su temperatura, composición química, corrientes y vida son el motor de los sistemas globales que hacen que la Tierra sea un lugar habitable para los seres humanos. La forma en que gestionamos este recurso vital es fundamental para la humanidad y para contrarrestar los efectos del cambio climático.\n\nLos Objetivos de Desarrollo Sostenible generan un marco para ordenar y proteger de manera sostenible los ecosistemas marinos y costeros de la contaminación terrestre, así como para abordar los impactos de la acidificación de los océanos. Mejorar la conservación y el uso sostenible de los recursos oceánicos a través del derecho internacional también ayudará a mitigar algunos de los retos que enfrentan los océanos.';
    } if (icon == listas.listIcons()[14]) {
      return 'La vida humana depende de la tierra tanto como del océano para su sustento y subsistencia. La flora provee el 80% de la alimentación humana y la agricultura representa un recurso económico y un medio de desarrollo importante. A su vez, los bosques cubren el 30% de la superficie terrestre, proveen hábitats cruciales a millones de especies y son fuente importante de aire limpio y agua. Además, son fundamentales para combatir el cambio climático.\n\nSe deben tomar medidas urgentes para reducir la pérdida de hábitats naturales y biodiversidad que forman parte de nuestro patrimonio común y apoyar la seguridad alimentaria y del agua a nivel mundial, la mitigación y adaptación al cambio climático, y la paz y la seguridad.';
    } if (icon == listas.listIcons()[15]) {
      return 'Sin paz, estabilidad, derechos humanos y gobernabilidad efectiva basada en el Estado de derecho, no es posible alcanzar el desarrollo sostenible. Vivimos en un mundo cada vez más dividido. Algunas regiones gozan de niveles permanentes de paz, seguridad y prosperidad, mientras que otras caen en ciclos aparentemente eternos de conflicto y violencia. De ninguna manera se trata de algo inevitable y debe ser abordado.\n\nLos Objetivos de Desarrollo Sostenible buscan reducir sustancialmente todas las formas de violencia y trabajan con los gobiernos y las comunidades para encontrar soluciones duraderas a los conflictos e inseguridad. El fortalecimiento del Estado de derecho y la promoción de los derechos humanos es fundamental en este proceso, así como la reducción del flujo de armas ilícitas y la consolidación de la participación de los países en desarrollo en las instituciones de gobernabilidad mundial.';
    } if (icon == listas.listIcons()[16]) {
      return 'Los Objetivos de Desarrollo Sostenible solo se pueden lograr con el compromiso decidido a favor de alianzas mundiales y cooperación. La Asistencia Oficial para el Desarrollo se mantuvo estable pero por debajo del objetivo, a US\$147.000 millones en 2017, mientras que las crisis humanitarias provocadas por conflictos o desastres naturales continúan demandando más recursos y ayuda financiera. Muchos países también requieren de esta asistencia para estimular el crecimiento y el intercambio comercial.\n\nLa finalidad de los objetivos es mejorar la cooperación Norte-Sur y Sur-Sur, apoyando los planes nacionales en el cumplimiento de todas las metas. Promover el comercio internacional y ayudar a los países en desarrollo para que aumenten sus exportaciones, forma parte del desafío de lograr un sistema de comercio universal equitativo y basado en reglas que sea justo, abierto y beneficie a todos.';
    } else {
      return 'La categoria NO existe!';
    }
  }

  /*
  String textCategory(String string) {
    if (string == 'sdg-es-01.png') {
      return 'Fin de la Pobreza';
    } if (string == 'sdg-es-02.png') {
      return 'Hambre Cero';
    } if (string == 'sdg-es-03.png') {
      return 'Salud y Bienestar';
    } if (string == 'sdg-es-04.png') {
      return 'Educación de Calidad';
    } if (string == 'sdg-es-05.png') {
      return 'Igualdad de Género';
    } if (string == 'sdg-es-06.png') {
      return 'Agua Limpia y Saneamiento';
    } if (string == 'sdg-es-07.png') {
      return 'Energia Asequible y no Contaminante';
    } if (string == 'sdg-es-08.png') {
      return 'Trabajo Decente y Crecimiento Económico';
    } if (string == 'sdg-es-09.png') {
      return 'Industria, Innovación e Infraestructura';
    } if (string == 'sdg-es-10.png') {
      return 'Reducción de las Desigualdades';
    } if (string == 'sdg-es-11.png') {
      return 'Ciudades y Comunidades Sostenibles';
    } if (string == 'sdg-es-12.png') {
      return 'Producción y Consumo Responsables';
    } if (string == 'sdg-es-13.png') {
      return 'Acción por el Clima';
    } if (string == 'sdg-es-14.png') {
      return 'Vida Submarina';
    } if (string == 'sdg-es-15.png') {
      return 'Vida de Ecosistemas Terrestres';
    } if (string == 'sdg-es-16.png') {
      return 'Paz, Justicia e Instituciones Sólidas';
    } if (string == 'sdg-es-17.png') {
      return 'Alianzas para lograr los objetivos';
    } else {
      return 'La categoria NO existe!';
    }
  }

  String textIcon(String text){
    if (text == 'Fin de la Pobreza') {
      return 'sdg-es-01.png';
    } if (text == 'Hambre Cero') {
      return 'sdg-es-02.png';
    } if (text == 'Salud y Bienestar') {
      return 'sdg-es-03.png';
    } if (text == 'Educación de Calidad') {
      return 'sdg-es-04.png';
    } if (text == 'Igualdad de Género') {
      return 'sdg-es-05.png';
    } if (text == 'Agua Limpia y Saneamiento') {
      return 'sdg-es-06.png';
    } if (text == 'Energia Asequible y no Contaminante') {
      return 'sdg-es-07.png';
    } if (text == 'Trabajo Decente y Crecimiento Económico') {
      return 'sdg-es-08.png';
    } if (text == 'Industria, Innovación e Infraestructura') {
      return 'sdg-es-09.png';
    } if (text == 'Reducción de las Desigualdades') {
      return 'sdg-es-10.png';
    } if (text == 'Ciudades y Comunidades Sostenibles') {
      return 'sdg-es-11.png';
    } if (text == 'Producción y Consumo Responsables') {
      return 'sdg-es-12.png';
    } if (text == 'Acción por el Clima') {
      return 'sdg-es-13.png';
    } if (text == 'Vida Submarina') {
      return 'sdg-es-14.png';
    } if (text == 'Vida de Ecosistemas Terrestres') {
      return 'sdg-es-15.png';
    } if (text == 'Paz, Justicia e Instituciones Sólidas') {
      return 'sdg-es-16.png';
    } if (text == 'Alianzas para lograr los objetivos') {
      return 'sdg-es-17.png';
    } else {
      return 'La categoria NO existe!';
    }
  }
  */
}