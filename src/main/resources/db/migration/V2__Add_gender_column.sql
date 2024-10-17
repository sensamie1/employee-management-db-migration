DO $$ 
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'gender_enum') THEN
    CREATE TYPE gender_enum AS ENUM ('male', 'female', 'other');
  END IF;
END $$;

ALTER TABLE employees
ADD COLUMN gender gender_enum NOT NULL DEFAULT 'other';
