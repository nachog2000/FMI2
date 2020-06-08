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

