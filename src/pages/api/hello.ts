// Next.js API route support: https://nextjs.org/docs/api-routes/introduction
import type { NextApiRequest, NextApiResponse } from "next";
import { createConnection } from "mysql";

const connection = createConnection({
	host: process.env.DB_HOST,
	user: process.env.DB_USERNAME,
	password: process.env.DB_PASSWORD,
	database: process.env.DB_NAME,
});

connection.connect();

type Data = {
	name: string;
};

export default function handler(req: NextApiRequest, res: NextApiResponse) {
	connection.query("SELECT * FROM users", (error, results, fields) => {
		if (error) throw error;

		res.status(200).json({
			results: results,
		});
	});
}
