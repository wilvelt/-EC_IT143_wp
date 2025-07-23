

DROP TABLE IF EXISTS dbo.t_avg_gpa_placed;
GO

CREATE TABLE dbo.t_avg_gpa_placed
(
    avg_gpa_placed DECIMAL(4,2) NOT NULL,
    CONSTRAINT PK_avg_gpa_placed PRIMARY KEY (avg_gpa_placed)
);
