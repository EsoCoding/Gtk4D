/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module soup.HSTSEnforcerDB;

private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import soup.HSTSEnforcer;
private import soup.c.functions;
public  import soup.c.types;


/**
 * Persistent HTTP Strict Transport Security enforcer.
 * 
 * #SoupHSTSEnforcerDB is a [class@HSTSEnforcer] that uses a SQLite
 * database as a backend for persistency.
 */
public class HSTSEnforcerDB : HSTSEnforcer
{
	/** the main Gtk struct */
	protected SoupHSTSEnforcerDB* soupHSTSEnforcerDB;

	/** Get the main Gtk struct */
	public SoupHSTSEnforcerDB* getHSTSEnforcerDBStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return soupHSTSEnforcerDB;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)soupHSTSEnforcerDB;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (SoupHSTSEnforcerDB* soupHSTSEnforcerDB, bool ownedRef = false)
	{
		this.soupHSTSEnforcerDB = soupHSTSEnforcerDB;
		super(cast(SoupHSTSEnforcer*)soupHSTSEnforcerDB, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return soup_hsts_enforcer_db_get_type();
	}

	/**
	 * Creates a #SoupHSTSEnforcerDB.
	 *
	 * @filename will be read in during the initialization of a
	 * #SoupHSTSEnforcerDB, in order to create an initial set of HSTS
	 * policies. If the file doesn't exist, a new database will be created
	 * and initialized. Changes to the policies during the lifetime of a
	 * #SoupHSTSEnforcerDB will be written to @filename when
	 * [signal@HSTSEnforcer::changed] is emitted.
	 *
	 * Params:
	 *     filename = the filename of the database to read/write from.
	 *
	 * Returns: the new #SoupHSTSEnforcer
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string filename)
	{
		auto __p = soup_hsts_enforcer_db_new(Str.toStringz(filename));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(SoupHSTSEnforcerDB*) __p, true);
	}
}
