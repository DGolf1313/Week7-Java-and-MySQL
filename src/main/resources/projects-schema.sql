DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
	project_id INT AUTO_INCREMENT NOT NULL,
	project_name VARCHAR(128) NOT NULL,
	estimated_hours DECIMAL (7,2),
	actual_hours DECIMAL (7,2),
	difficulty INT,
	notes TEXT,
	PRIMARY KEY (project_id)
);

CREATE TABLE category(
	category_id INT AUTO_INCREMENT,
	category_name VARCHAR(128),
	PRIMARY KEY(category_id)
);

CREATE TABLE project_category (
	project_id INT,
	category_id INT,
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
	FOREIGN KEY (category_id) references category (category_id) ON DELETE CASCADE,
	UNIQUE KEY (project_id, category_id)
);

CREATE TABLE material(
	material_id INT AUTO_INCREMENT,
	project_id INT,
	material_name VARCHAR(128),
	num_required INT NOT NULL,
	cost DECIMAL(7,2) NOT NULL,
	PRIMARY KEY (material_id),
	FOREIGN KEY (project_id) REFERENCES project (project_id)
);

CREATE TABLE step(
	step_id INT AUTO_INCREMENT,
	project_id INT,
	step_text TEXT,
	step_order INT,
	PRIMARY KEY (step_id),
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);