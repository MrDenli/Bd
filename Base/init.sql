CREATE TABLE public.person (
	id_person int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	surname varchar NOT NULL,
	sex varchar NOT NULL,
	password varchar NOT NULL,
	passport_number int4 NOT NULL,
	CONSTRAINT person_pk PRIMARY KEY (id_person)
);

CREATE TABLE public.department (
	id_department int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	adress varchar NOT NULL,
	CONSTRAINT department_pk PRIMARY KEY (id_department)
);

CREATE TABLE public."group" (
	id_group int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	course_number int4 NOT NULL,
	CONSTRAINT group_pk PRIMARY KEY (id_group)
);

CREATE TABLE public.teacher (
	id_teacher int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_person int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	id_department int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	CONSTRAINT teacher_pk PRIMARY KEY (id_teacher),
	CONSTRAINT teacher_fk FOREIGN KEY (id_person) REFERENCES public.person(id_person),
	CONSTRAINT teacher_fk_1 FOREIGN KEY (id_department) REFERENCES public.department(id_department)
);

CREATE TABLE public.student (
	id_student int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_person int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	id_group int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	CONSTRAINT student_pk PRIMARY KEY (id_student),
	CONSTRAINT student_fk FOREIGN KEY (id_person) REFERENCES public.person(id_person),
	CONSTRAINT student_fk_1 FOREIGN KEY (id_group) REFERENCES public."group"(id_group)
);

CREATE TABLE public.subject (
	id_subject int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_teacher int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	"name" varchar NOT NULL,
	hours int4 NOT NULL,
	CONSTRAINT subject_pk PRIMARY KEY (id_subject),
	CONSTRAINT subject_fk FOREIGN KEY (id_teacher) REFERENCES public.teacher(id_teacher)
);

CREATE TABLE public.mark (
	id_mark int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_student int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	id_subject int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	value int4 NOT NULL,			
	"date" date NOT NULL,
	CONSTRAINT mark_pk PRIMARY KEY (id_mark),
	CONSTRAINT mark_fk FOREIGN KEY (id_student) REFERENCES public.student(id_student),
	CONSTRAINT mark_fk_1 FOREIGN KEY (id_subject) REFERENCES public.subject(id_subject)
);

