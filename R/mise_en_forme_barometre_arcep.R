# ---------------------------- #
# Mise en forme base ARCEP #
# ---------------------------- #

library(tidyverse)

# Import ------------------------------------------------------------------
df_barometre_init <-
  read_delim(
    "data-raw/barometredunumerique-2007-2019-fus.csv",
    delim = ";",
    guess_max = 28900
  )

# Selection des colonnes --------------------------------------------------
df_barometre_select <- df_barometre_init %>%
  select(
    annee,
    INTER,
    POND,
    AGE6FUZ,
    SEXE,
    DIPL5,
    FREINWEB,
    INTERNET,
    INTER,
    HR_TELE,
    HR_WEB,
    MICRO,
    TABLETTE,
    TELFIXE,
    US_ACHAT,
    US_FACEB
  ) %>%
  rename_all(tolower) %>% 
  mutate(pond = str_replace(pond, ",", "."))


# Export ------------------------------------------------------------------
writexl::write_xlsx(df_barometre_select, "data/barometre_credoc_0719_extrait.xlsx")
