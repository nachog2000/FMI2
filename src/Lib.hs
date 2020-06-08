module Lib where
import Text.Show.Functions

laVerdad = True


-- Punto 1)

data Pais = UnPais {
    ingresoPerCapita :: Float,
    poblacionSectorPublico :: Float,
    poblacionSectorPrivado :: Float,
    recursosNaturales :: [String],
    deudaConFMI :: Float
}deriving (Show)

namibia :: Pais
namibia = UnPais {
    ingresoPerCapita = 4140,
    poblacionSectorPublico = 400000,
    poblacionSectorPrivado = 650000,
    recursosNaturales = ["Mineria","Ecoturismo"],
    deudaConFMI = 50
}


-- Punto 2)

type Estrategia = Pais -> Pais

prestarMillonesDolares :: Float -> Estrategia
prestarMillonesDolares cuanto pais = pais {deudaConFMI = deudaConFMI pais + interes cuanto}
interes :: Float -> Float
interes deuda = deuda * 1.5

reducirPuestosSectorPublico :: Float -> Estrategia
reducirPuestosSectorPublico cantidad pais = pais {poblacionSectorPublico = poblacionSectorPublico pais - cantidad,
                                                  ingresoPerCapita = ingresoPerCapita pais - ingresoPerCapita pais * reducirIngresoPerCapita cantidad  
                                                 }

reducirIngresoPerCapita :: Float -> Float 
reducirIngresoPerCapita cantPuestos | cantPuestos > 100 = 0.2
                                    | otherwise = 0.15


explotacionRecursosNaturales ::String ->  Estrategia
explotacionRecursosNaturales recurso pais = pais {deudaConFMI = disminuirDeudaConFMI 2 pais, 
                                                  recursosNaturales = quitarRecurso recurso (recursosNaturales pais)      
                                                 }

disminuirDeudaConFMI :: Float -> Pais -> Float
disminuirDeudaConFMI cantidad pais = deudaConFMI pais - cantidad

quitarRecurso :: String -> [String] -> [String]
quitarRecurso recurso = filter (/=recurso)


blindaje :: Estrategia
blindaje pais = ((prestarMillonesDolares (((*0.5).pbi) pais)) . (reducirPuestosSectorPublico 500)) pais

pbi :: Pais -> Float
pbi pais = ingresoPerCapita pais * poblacionActiva pais

poblacionActiva :: Pais -> Float
poblacionActiva pais = poblacionSectorPublico pais + poblacionSectorPrivado pais

