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


module soup.Multipart;

private import glib.Bytes;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import soup.MessageHeaders;
private import soup.c.functions;
public  import soup.c.types;


/**
 * Represents a multipart HTTP message body, parsed according to the
 * syntax of RFC 2046.
 * 
 * Of particular interest to HTTP are `multipart/byte-ranges` and
 * `multipart/form-data`,
 * 
 * Although the headers of a #SoupMultipart body part will contain the
 * full headers from that body part, libsoup does not interpret them
 * according to MIME rules. For example, each body part is assumed to
 * have "binary" Content-Transfer-Encoding, even if its headers
 * explicitly state otherwise. In other words, don't try to use
 * #SoupMultipart for handling real MIME multiparts.
 */
public class Multipart
{
	/** the main Gtk struct */
	protected SoupMultipart* soupMultipart;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public SoupMultipart* getMultipartStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return soupMultipart;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)soupMultipart;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (SoupMultipart* soupMultipart, bool ownedRef = false)
	{
		this.soupMultipart = soupMultipart;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( ownedRef )
			soup_multipart_free(soupMultipart);
	}


	/** */
	public static GType getType()
	{
		return soup_multipart_get_type();
	}

	/**
	 * Creates a new empty #SoupMultipart with a randomly-generated
	 * boundary string.
	 *
	 * Note that @mime_type must be the full MIME type, including "multipart/".
	 *
	 * See also: [ctor@Message.new_from_multipart].
	 *
	 * Params:
	 *     mimeType = the MIME type of the multipart to create.
	 *
	 * Returns: a new empty #SoupMultipart of the given @mime_type
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string mimeType)
	{
		auto __p = soup_multipart_new(Str.toStringz(mimeType));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(SoupMultipart*) __p);
	}

	/**
	 * Parses @headers and @body to form a new #SoupMultipart
	 *
	 * Params:
	 *     headers = the headers of the HTTP message to parse
	 *     body_ = the body of the HTTP message to parse
	 *
	 * Returns: a new #SoupMultipart (or %NULL if the
	 *     message couldn't be parsed or wasn't multipart).
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(MessageHeaders headers, Bytes body_)
	{
		auto __p = soup_multipart_new_from_message((headers is null) ? null : headers.getMessageHeadersStruct(), (body_ is null) ? null : body_.getBytesStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_from_message");
		}

		this(cast(SoupMultipart*) __p);
	}

	/**
	 * Adds a new MIME part containing @body to @multipart
	 *
	 * Uses "Content-Disposition: form-data", as per the HTML forms specification.
	 *
	 * Params:
	 *     controlName = the name of the control associated with this file
	 *     filename = the name of the file, or %NULL if not known
	 *     contentType = the MIME type of the file, or %NULL if not known
	 *     body_ = the file data
	 */
	public void appendFormFile(string controlName, string filename, string contentType, Bytes body_)
	{
		soup_multipart_append_form_file(soupMultipart, Str.toStringz(controlName), Str.toStringz(filename), Str.toStringz(contentType), (body_ is null) ? null : body_.getBytesStruct());
	}

	/**
	 * Adds a new MIME part containing @data to @multipart.
	 *
	 * Uses "Content-Disposition: form-data", as per the HTML forms specification.
	 *
	 * Params:
	 *     controlName = the name of the control associated with @data
	 *     data = the body data
	 */
	public void appendFormString(string controlName, string data)
	{
		soup_multipart_append_form_string(soupMultipart, Str.toStringz(controlName), Str.toStringz(data));
	}

	/**
	 * Adds a new MIME part to @multipart with the given headers and body.
	 *
	 * (The multipart will make its own copies of @headers and @body, so
	 * you should free your copies if you are not using them for anything
	 * else.)
	 *
	 * Params:
	 *     headers = the MIME part headers
	 *     body_ = the MIME part body
	 */
	public void appendPart(MessageHeaders headers, Bytes body_)
	{
		soup_multipart_append_part(soupMultipart, (headers is null) ? null : headers.getMessageHeadersStruct(), (body_ is null) ? null : body_.getBytesStruct());
	}

	/**
	 * Frees @multipart.
	 */
	public void free()
	{
		soup_multipart_free(soupMultipart);
		ownedRef = false;
	}

	/**
	 * Gets the number of body parts in @multipart.
	 *
	 * Returns: the number of body parts in @multipart
	 */
	public int getLength()
	{
		return soup_multipart_get_length(soupMultipart);
	}

	/**
	 * Gets the indicated body part from @multipart.
	 *
	 * Params:
	 *     part = the part number to get (counting from 0)
	 *     headers = return location for the MIME part
	 *         headers
	 *     body_ = return location for the MIME part
	 *         body
	 *
	 * Returns: %TRUE on success, %FALSE if @part is out of range (in
	 *     which case @headers and @body won't be set)
	 */
	public bool getPart(int part, out MessageHeaders headers, out Bytes body_)
	{
		SoupMessageHeaders* outheaders = null;
		GBytes* outbody_ = null;

		auto __p = soup_multipart_get_part(soupMultipart, part, &outheaders, &outbody_) != 0;

		headers = ObjectG.getDObject!(MessageHeaders)(outheaders);
		body_ = new Bytes(outbody_);

		return __p;
	}

	/**
	 * Serializes @multipart to @dest_headers and @dest_body.
	 *
	 * Params:
	 *     destHeaders = the headers of the HTTP message to serialize @multipart to
	 *     destBody = the body of the HTTP message to serialize @multipart to
	 */
	public void toMessage(MessageHeaders destHeaders, out Bytes destBody)
	{
		GBytes* outdestBody = null;

		soup_multipart_to_message(soupMultipart, (destHeaders is null) ? null : destHeaders.getMessageHeadersStruct(), &outdestBody);

		destBody = new Bytes(outdestBody);
	}
}
