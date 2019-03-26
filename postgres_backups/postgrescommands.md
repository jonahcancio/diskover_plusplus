# Show All Primary and Foreign Keys
    SELECT conrelid::regclass AS table_from
    , conname
    , pg_get_constraintdef(c.oid)
    FROM   pg_constraint c
    JOIN   pg_namespace n ON n.oid = c.connamespace
    WHERE  contype IN ('f', 'p ')
    AND    n.nspname = 'public' -- your schema here
    ORDER  BY conrelid::regclass::text, contype DESC;


# Adding Primary Keys
    ALTER TABLE inside
    ADD PRIMARY KEY (id);

# Adding Auto Incrementing Primary Key Column
    ALTER TABLE inside ADD COLUMN id SERIAL PRIMARY KEY;

# Deleting Primary Keys
    ALTER TABLE inside DROP CONSTRAINT inside_pkey;

# Adding Foreign Keys
    ALTER TABLE inside
    ADD CONSTRAINT location_fk
    FOREIGN KEY (loc_id)
    REFERENCES location(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

# Deleting Foreign Keys
    ALTER TABLE inside
    DROP CONSTRAINT location_fk;

# Updating Foreign Keys
    UPDATE inside   
    SET loc_id = location.id   
    FROM location   
    WHERE inside.building = location.name;  

