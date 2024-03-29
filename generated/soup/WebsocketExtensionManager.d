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


module soup.WebsocketExtensionManager;

private import gobject.ObjectG;
private import soup.SessionFeatureIF;
private import soup.SessionFeatureT;
private import soup.c.functions;
public  import soup.c.types;


/**
 * SoupWebsocketExtensionManager is the [iface@SessionFeature] that handles WebSockets
 * extensions for a [class@Session].
 * 
 * A #SoupWebsocketExtensionManager is added to the session by default, and normally
 * you don't need to worry about it at all. However, if you want to
 * disable WebSocket extensions, you can remove the feature from the
 * session with [method@Session.remove_feature_by_type] or disable it on
 * individual requests with [method@Message.disable_feature].
 */
public class WebsocketExtensionManager : ObjectG, SessionFeatureIF
{
	/** the main Gtk struct */
	protected SoupWebsocketExtensionManager* soupWebsocketExtensionManager;

	/** Get the main Gtk struct */
	public SoupWebsocketExtensionManager* getWebsocketExtensionManagerStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return soupWebsocketExtensionManager;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)soupWebsocketExtensionManager;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (SoupWebsocketExtensionManager* soupWebsocketExtensionManager, bool ownedRef = false)
	{
		this.soupWebsocketExtensionManager = soupWebsocketExtensionManager;
		super(cast(GObject*)soupWebsocketExtensionManager, ownedRef);
	}

	// add the SessionFeature capabilities
	mixin SessionFeatureT!(SoupWebsocketExtensionManager);


	/** */
	public static GType getType()
	{
		return soup_websocket_extension_manager_get_type();
	}
}
