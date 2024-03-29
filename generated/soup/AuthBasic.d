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


module soup.AuthBasic;

private import soup.Auth;
private import soup.c.functions;
public  import soup.c.types;


/**
 * HTTP "Basic" authentication.
 * 
 * [class@Session]s support this by default; if you want to disable
 * support for it, call [method@Session.remove_feature_by_type],
 * passing %SOUP_TYPE_AUTH_BASIC.
 */
public class AuthBasic : Auth
{
	/** the main Gtk struct */
	protected SoupAuthBasic* soupAuthBasic;

	/** Get the main Gtk struct */
	public SoupAuthBasic* getAuthBasicStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return soupAuthBasic;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)soupAuthBasic;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (SoupAuthBasic* soupAuthBasic, bool ownedRef = false)
	{
		this.soupAuthBasic = soupAuthBasic;
		super(cast(SoupAuth*)soupAuthBasic, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return soup_auth_basic_get_type();
	}
}
