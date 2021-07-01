-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/ff61ll
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "happy" (
    "Country" varchar(40)   NOT NULL,
    "Region" varchar(40)   NOT NULL,
    "Happiness_Rank" int   NOT NULL,
    "Happiness_Score" float   NOT NULL,
    "Lower_Confidence_Interval" float   NOT NULL,
    "Upper_Confidence_Interval" float   NOT NULL,
    "Economy_GDP_per_Capita" float   NOT NULL,
    "Family" float   NOT NULL,
    "Health_Life_Expectancy" float   NOT NULL,
    "Freedom" float   NOT NULL,
    "Trust_Government_Corruption" float   NOT NULL,
    "Generosity" float   NOT NULL,
    "Dystopia_Residual" float   NOT NULL,
    CONSTRAINT "pk_happy" PRIMARY KEY (
        "Happiness_Rank"
     )
);

CREATE TABLE "happy_alc" (
    "Country" varchar(40)   NOT NULL,
    "Region" varchar(40)   NOT NULL,
    "Hemisphere" varchar(40)   NOT NULL,
    "HappinessScore" float   NOT NULL,
    "HDI" int   NOT NULL,
    "GDP_PerCapita" int   NOT NULL,
    "Beer_PerCapita" int   NOT NULL,
    "Spirit_PerCapita" int   NOT NULL,
    "Wine_PerCapita" int   NOT NULL,
    CONSTRAINT "pk_happy_alc" PRIMARY KEY (
        "Country"
     )
);

CREATE TABLE "combined_happy" (
    "Country" varchar(40)   NOT NULL,
    "Region" varchar(40)   NOT NULL,
    "Hemisphere" varchar(40)   NOT NULL,
    "Happiness_Rank" int   NOT NULL,
    "Happiness_Score" float   NOT NULL,
    "Beer_PerCapita" int   NOT NULL,
    "Spirit_PerCapita" int   NOT NULL,
    "Wine_PerCapita" int   NOT NULL,
    "Economy_GDP_per_Capita" float   NOT NULL,
    "Family" float   NOT NULL,
    "Health_Life_Expectancy" float   NOT NULL,
    "Freedom" float   NOT NULL,
    "Trust_Government_Corruption" float   NOT NULL,
    "Generosity" float   NOT NULL,
    "Dystopia_Residual" float   NOT NULL,
    CONSTRAINT "pk_combined_happy" PRIMARY KEY (
        "Happiness_Rank"
     )
);

ALTER TABLE "happy" ADD CONSTRAINT "fk_happy_Country" FOREIGN KEY("Country")
REFERENCES "happy_alc" ("Country");

ALTER TABLE "happy" ADD CONSTRAINT "fk_happy_Happiness_Rank" FOREIGN KEY("Happiness_Rank")
REFERENCES "combined_happy" ("Happiness_Rank");

ALTER TABLE "combined_happy" ADD CONSTRAINT "fk_combined_happy_Country" FOREIGN KEY("Country")
REFERENCES "happy" ("Country");

