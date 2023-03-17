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


module soup.AuthManager;

private import glib.Uri;
private import gobject.ObjectG;
private import soup.Auth;
private import soup.SessionFeatureIF;
private import soup.SessionFeatureT;
private import soup.c.functions;
public  import soup.c.types;


/**
 * HTTP client-side authentication handler.
 * 
 * #SoupAuthManager is the [iface@SessionFeature] that handles HTTP
 * authentication for a [class@Session].
 * 
 * A #SoupAuthManager is added to the session by default, and normally
 * you don't need to worry about it at all. However, if you want to
 * disable HTTP authentication, you can remove the feature from the
 * session with [method@Session.remove_feature_by_type] or disable it on
 * individual requests with [method@Message.disable_feature].
 * 
 * You can use this with [method@Session.remove_feature_by_type] or
 * [method@Message.disable_feature].
 * 
 * (Although this type has only been publicly visible since libsoup 2.42, it has
 * always existed in the background, and you can use `g_type_from_name
 * ("SoupAuthManager")` to get its [alias@GLib.Type] in earlier releases.)
 */
public class AuthManager : ObjectG, SessionFeatureIF
{
	/** the main Gtk struct */
	protected SoupAuthManager* soupAuthManager;

	/** Get the main Gtk struct */
	public SoupAuthManager* getAuthManagerStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return soupAuthManager;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)soupAuthManager;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (SoupAuthManager* soupAuthManager, bool ownedRef = false)
	{
		this.soupAuthManager = soupAuthManager;
		super(cast(GObject*)soupAuthManager, ownedRef);
	}

	// add the SessionFeature capabilities
	mixin SessionFeatureT!(SoupAuthManager);


	/** */
	public static GType getType()
	{
		return soup_auth_manager_get_type();
	}

	/**
	 * Clear all credentials cached by @manager.
	 */
	public void clearCachedCredentials()
	{
		soup_auth_manager_clear_cached_credentials(soupAuthManager);
	}

	/**
	 * Records that @auth is to be used under @uri, as though a
	 * WWW-Authenticate header had been received at that URI.
	 *
	 * This can be used to "preload" @manager's auth cache, to avoid an extra HTTP
	 * round trip in the case where you know ahead of time that a 401 response will
	 * be returned.
	 *
	 * This is only useful for authentication types where the initial
	 * Authorization header does not depend on any additional information
	 * from the server. (Eg, Basic or NTLM, but not Digest.)
	 *
	 * Params:
	 *     uri = the #GUri under which @auth is to be used
	 *     auth = the #SoupAuth to use
	 */
	public void useAuth(Uri uri, Auth auth)
	{
		soup_auth_manager_use_auth(soupAuthManager, (uri is null) ? null : uri.getUriStruct(), (auth is null) ? null : auth.getAuthStruct());
	}
}
