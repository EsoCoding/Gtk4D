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


module soup.CookieJarDB;

private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import soup.CookieJar;
private import soup.c.functions;
public  import soup.c.types;


/**
 * Database-based Cookie Jar.
 * 
 * #SoupCookieJarDB is a [class@CookieJar] that reads cookies from and writes
 * them to a sqlite database in the new Mozilla format.
 * 
 * (This is identical to `SoupCookieJarSqlite` in
 * libsoup-gnome; it has just been moved into libsoup proper, and
 * renamed to avoid conflicting.)
 */
public class CookieJarDB : CookieJar
{
	/** the main Gtk struct */
	protected SoupCookieJarDB* soupCookieJarDB;

	/** Get the main Gtk struct */
	public SoupCookieJarDB* getCookieJarDBStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return soupCookieJarDB;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)soupCookieJarDB;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (SoupCookieJarDB* soupCookieJarDB, bool ownedRef = false)
	{
		this.soupCookieJarDB = soupCookieJarDB;
		super(cast(SoupCookieJar*)soupCookieJarDB, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return soup_cookie_jar_db_get_type();
	}

	/**
	 * Creates a #SoupCookieJarDB.
	 *
	 * @filename will be read in at startup to create an initial set of cookies. If
	 * @read_only is %FALSE, then the non-session cookies will be written to
	 * @filename when the [signal@CookieJar::changed] signal is emitted from the
	 * jar. (If @read_only is %TRUE, then the cookie jar will only be used for this
	 * session, and changes made to it will be lost when the jar is destroyed.)
	 *
	 * Params:
	 *     filename = the filename to read to/write from, or %NULL
	 *     readOnly = %TRUE if @filename is read-only
	 *
	 * Returns: the new #SoupCookieJar
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string filename, bool readOnly)
	{
		auto __p = soup_cookie_jar_db_new(Str.toStringz(filename), readOnly);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(SoupCookieJarDB*) __p, true);
	}
}
