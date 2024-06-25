const { getQuery } = require("../database/query");

const insertColocacionesInDB = async (csvInfo) => {
	try {
		if (!(csvInfo.correctRows)) { return };
		let promises = [];

		const array = csvInfo.correctRows;

		array.map(async (item, index) => {
			if (index == 0) { return; }

			promises.push((async () => {

				const keys = Object.keys(item.data).join(", ");
				const values = Object.values(item.data).map(item => typeof item === 'string' ? `'${item}'` : item).join(", ");

				await getQuery(`INSERT INTO colocaciones (${keys}) VALUES (${values})`);
			})());
		});

		await Promise.all(promises);
		return;
	}
	catch (err) {
		throw new Error(err);
	}


}

module.exports = { insertColocacionesInDB };