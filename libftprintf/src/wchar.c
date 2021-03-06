/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   wchar.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cchampou <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/06/14 11:01:32 by cchampou          #+#    #+#             */
/*   Updated: 2017/06/22 18:12:51 by cchampou         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

void	wchar_convert(char *s, wchar_t c)
{
	if (c <= 0x7F)
	{
		s[0] = c;
		s[1] = 0;
	}
	else if (c <= 0x7FF)
	{
		s[0] = ((c >> 6) + 0xC0);
		s[1] = ((c & 0x3F) + 0x80);
	}
	else if (c <= 0xFFFF)
	{
		s[0] = ((c >> 12) + 0xE0);
		s[1] = (((c >> 6) & 0x3F) + 0x80);
		s[2] = ((c & 0x3F) + 0x80);
	}
	else if (c <= 0x10FFFF)
	{
		s[0] = ((c >> 18) + 0xF0);
		s[1] = (((c >> 12) & 0x3F) + 0x80);
		s[2] = (((c >> 6) & 0x3F) + 0x80);
		s[3] = ((c & 0x3F) + 0x80);
	}
}
